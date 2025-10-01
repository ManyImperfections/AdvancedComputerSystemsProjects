#!/usr/bin/env python3
import json, glob, os
import pandas as pd
import matplotlib.pyplot as plt

RESULT_DIRS = sorted(glob.glob("fio_results_*"))
if not RESULT_DIRS:
    print("No fio_results_* directories found. Run run_fio_sweeps.sh first.")
    exit(1)

RESULT_DIR = RESULT_DIRS[-1]
print("Reading results from:", RESULT_DIR)

rows = []
for fn in sorted(glob.glob(os.path.join(RESULT_DIR, "*.json"))):
    with open(fn, "r") as f:
        data = json.load(f)
    job = data.get("jobs", [None])[0]
    if job is None:
        continue

    name = job.get("jobname", os.path.basename(fn))

    # pick stats: read/write/mixed
    if job.get("read", {}).get("io_bytes", 0) > 0:
        stats = job["read"]
        rw = "read"
    elif job.get("write", {}).get("io_bytes", 0) > 0:
        stats = job["write"]
        rw = "write"
    else:
        stats = job.get("read", {})
        rw = "mixed"

    bw = stats.get("bw_bytes", 0) / (1024.0 * 1024.0)   # MB/s
    iops = stats.get("iops", 0)

    # ---- latency handling ----
    avg_lat_ns = None
    p95 = p99 = p999 = None
    lat_field = None

    # try clat → lat → lat_ns/lat_us
    for cand in ("clat", "lat"):
        if cand in stats and stats[cand]:
            lat_field = stats[cand]
            break

    if lat_field:
        avg_lat_ns = lat_field.get("mean")
        if "percentile" in lat_field:
            for p in lat_field["percentile"]:
                pct = p.get("percentile")
                if abs(pct - 95.0) < 1e-3:
                    p95 = p["value"]
                elif abs(pct - 99.0) < 1e-3:
                    p99 = p["value"]
                elif abs(pct - 99.9) < 1e-3:
                    p999 = p["value"]

    # fallback if nothing found
    if avg_lat_ns is None:
        if "lat_ns" in stats:
            avg_lat_ns = stats["lat_ns"].get("mean")
        elif "lat_us" in stats:
            avg_lat_ns = stats["lat_us"].get("mean")

    rows.append({
        "file": os.path.basename(fn),
        "name": name,
        "rw": rw,
        "bw_MB_s": bw,
        "iops": iops,
        "avg_lat_ns": avg_lat_ns,
        "p95_ns": p95,
        "p99_ns": p99,
        "p99.9_ns": p999,
    })

df = pd.DataFrame(rows)
csv_out = os.path.join(RESULT_DIR, "summary.csv")
df.to_csv(csv_out, index=False)
print("Summary CSV written to", csv_out)
print(df[["file","bw_MB_s","iops","avg_lat_ns","p95_ns","p99_ns","p99.9_ns"]])

# ---- Example plots (block-size & QD sweep) ----
bs_rows = df[df['file'].str.contains('randread_bs_|seqread_bs_')]
if not bs_rows.empty:
    import re
    bs_rows = bs_rows.copy()
    def get_bs(s):
        m = re.search(r'bs_(\d+k)', s)
        return m.group(1) if m else s
    def bs_val(bs):
        if bs.endswith('k'): return int(bs[:-1])
        try: return int(bs)
        except: return 0
    bs_rows['bs'] = bs_rows['file'].apply(get_bs)
    bs_rows['bs_k'] = bs_rows['bs'].apply(bs_val)
    bs_rows = bs_rows.sort_values('bs_k')

    plt.figure(figsize=(8,5))
    plt.plot(bs_rows['bs_k'], bs_rows['bw_MB_s'], marker='o')
    plt.xscale('log')
    plt.xlabel('Block size (KiB)')
    plt.ylabel('Throughput (MB/s)')
    plt.title('Block-size sweep (throughput)')
    plt.grid(True, which='both', ls='--')
    plt.savefig(os.path.join(RESULT_DIR, 'blocksize_throughput.png'))
    print("Saved:", os.path.join(RESULT_DIR, 'blocksize_throughput.png'))

qd_rows = df[df['file'].str.contains('randread_qd')]
if not qd_rows.empty:
    import re
    qd_rows = qd_rows.copy()
    qd_rows['qd'] = qd_rows['file'].str.extract(r'qd(\d+)').astype(int)
    qd_rows = qd_rows.sort_values('qd')

    plt.figure(figsize=(8,5))
    plt.plot(qd_rows['qd'], qd_rows['iops'], marker='o', label='IOPS')
    plt.plot(qd_rows['qd'], qd_rows['bw_MB_s'], marker='x', label='MB/s')
    plt.xscale('log')
    plt.xlabel('Queue depth')
    plt.ylabel('IOPS / MB/s')
    plt.title('Queue-depth sweep')
    plt.legend()
    plt.grid(True, which='both', ls='--')
    plt.savefig(os.path.join(RESULT_DIR, 'qd_sweep.png'))
    print("Saved:", os.path.join(RESULT_DIR, 'qd_sweep.png'))

    # throughput vs latency
    plt.figure(figsize=(8,5))
    plt.plot(qd_rows['bw_MB_s'], qd_rows['avg_lat_ns'].astype(float)/1000.0,
             marker='o')
    plt.xlabel('Throughput (MB/s)')
    plt.ylabel('Avg latency (us)')
    plt.title('Throughput vs latency (QD sweep)')
    plt.grid(True)
    plt.savefig(os.path.join(RESULT_DIR, 'throughput_vs_latency.png'))
    print("Saved:", os.path.join(RESULT_DIR, 'throughput_vs_latency.png'))
