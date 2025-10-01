#!/usr/bin/env bash
set -euo pipefail

# run_fio_sweeps.sh
# Usage: TEST_TARGET=/path/to/file_or_device ./run_fio_sweeps.sh
# Example:
#   TEST_TARGET=/Volumes/Bench/testfile.bin ./run_fio_sweeps.sh

if [ -z "${TEST_TARGET:-}" ]; then
  echo "Please set TEST_TARGET environment var to test file or raw device (e.g. /Volumes/Bench/testfile.bin)"
  exit 1
fi

OUTDIR="fio_results_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTDIR"
echo "Results -> $OUTDIR"

FIO="fio"  # ensure available in PATH
# Common fio settings
COMMON="--filename=${TEST_TARGET} --direct=1 --ioengine=posixaio --runtime=30 --time_based=1 --group_reporting=1 --numjobs=1 --name=job"

########################################
# 0) Precondition (optional but recommended)
# Write the device with sequential writes to push into steady state.
########################################
echo "Preconditioning target (this will write lots of data) — you should be sure this is safe!"
"$FIO" --name=precond --filename=${TEST_TARGET} --rw=write --bs=128k --size=100% --direct=1 --iodepth=32 --numjobs=1 --runtime=120 --time_based=1 --group_reporting=1 --output="${OUTDIR}/precondition.json" --output-format=json
echo "Preconditioning done."

########################################
# 1) Zero-queue baselines (QD=1)
# - 4KiB random read & write, and 128KiB sequential read & write
########################################
echo "Zero-queue baselines..."
$FIO $COMMON --rw=randread --bs=4k --iodepth=1 --name=randread_4k_qd1 --size=1G --output="${OUTDIR}/randread_4k_qd1.json" --output-format=json
$FIO $COMMON --rw=randwrite --bs=4k --iodepth=1 --name=randwrite_4k_qd1 --size=1G --output="${OUTDIR}/randwrite_4k_qd1.json" --output-format=json
$FIO $COMMON --rw=read --bs=128k --iodepth=1 --name=seqread_128k_qd1 --size=4G --output="${OUTDIR}/seqread_128k_qd1.json" --output-format=json
$FIO $COMMON --rw=write --bs=128k --iodepth=1 --name=seqwrite_128k_qd1 --size=4G --output="${OUTDIR}/seqwrite_128k_qd1.json" --output-format=json

########################################
# 2) Block-size sweep (random and sequential)
# 4k,16k,32k,64k,128k,256k
########################################
echo "Block-size sweep..."
for BS in 4k 16k 32k 64k 128k 256k; do
  $FIO $COMMON --rw=randread --bs=$BS --iodepth=32 --name=randread_bs_${BS} --size=4G --output="${OUTDIR}/randread_bs_${BS}.json" --output-format=json
  $FIO $COMMON --rw=read --bs=$BS --iodepth=32 --name=seqread_bs_${BS} --size=4G --output="${OUTDIR}/seqread_bs_${BS}.json" --output-format=json
done

########################################
# 3) Read/Write mix sweep (on 4KiB random)
# mixes: 100%R, 100%W, 70/30, 50/50 (fio's rw=randrw + rwmixread)
########################################
echo "Read/Write mix sweep..."
$FIO $COMMON --rw=randread --bs=4k --iodepth=32 --name=rand_read_100 --size=4G --output="${OUTDIR}/rand_read_100.json" --output-format=json
$FIO $COMMON --rw=randwrite --bs=4k --iodepth=32 --name=rand_write_100 --size=4G --output="${OUTDIR}/rand_write_100.json" --output-format=json
$FIO $COMMON --rw=randrw --bs=4k --iodepth=32 --rwmixread=70 --name=rand_mix_70r --size=4G --output="${OUTDIR}/rand_mix_70r.json" --output-format=json
$FIO $COMMON --rw=randrw --bs=4k --iodepth=32 --rwmixread=50 --name=rand_mix_50r --size=4G --output="${OUTDIR}/rand_mix_50r.json" --output-format=json

########################################
# 4) Queue-depth sweep (4k random), QD = 1,2,4,8,16,32,64
########################################
echo "Queue-depth sweep..."
for QD in 1 2 4 8 16 32 64; do
  $FIO $COMMON --rw=randread --bs=4k --iodepth=$QD --name=randread_qd${QD} --size=4G --output="${OUTDIR}/randread_qd${QD}.json" --output-format=json
done

########################################
# 5) Tail-latency characterization
# Run longer, time_based test with percentile stats (fio provides percentiles)
########################################
echo "Tail-latency tests (longer runs capturing percentiles)..."
$FIO $COMMON --rw=randread --bs=4k --iodepth=32 --name=tail_randread --size=4G --runtime=300 --time_based=1 --output="${OUTDIR}/tail_randread.json" --output-format=json
$FIO $COMMON --rw=randwrite --bs=4k --iodepth=32 --name=tail_randwrite --size=4G --runtime=300 --time_based=1 --output="${OUTDIR}/tail_randwrite.json" --output-format=json

echo "All runs complete. Results are in $OUTDIR"
