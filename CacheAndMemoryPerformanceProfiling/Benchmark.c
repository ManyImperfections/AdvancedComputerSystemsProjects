// clang++ Benchmark.cpp -O3 -std=c11 -march=native -o Benchmark.out -lpthread
// Uses clock_gettime(CLOCK_MONOTONIC). Ensure -O3 for best results
// Made with help from ChatGPT

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <inttypes.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/mman.h>
#include <assert.h>

static inline uint64_t now_ns(void){
    struct timespec ts ;
    clock_gettime(CLOCK_MONOTONIC, &ts) ;
    return (uint64_t)ts.tv_sec * 1000000000 + ts.tv_nsec ;
}


// Default Config
#define DEFAULT_REPEATS 5
#define DEFAULT_WARMUP 1

// Allocate Aligned Buffer
void *alignedAllocPages(size_t alignment, size_t size){
    void *ptr = NULL ;
    int r = posix_memalign(&ptr, alignment, size) ;
    if(r != 0) return NULL ;
    return ptr ;
}

// Prevent the compiler from optimizing away results
volatile uint64_t blackhole __attribute__((visibility("default"))) ;

// -----------------Pointer-Chase-Latency------------------------------
// Make list to chase down
size_t makeChaseList(size_t N, size_t strideBytes, uint64_t **out_arr){
    size_t elements = N / sizeof(uint64_t) ;
    uint64_t *arr = alignedAllocPages(64, N) ;
    if(!arr) return 0 ;
    
    size_t strideElems = (strideBytes + sizeof(uint64_t) - 1)/sizeof(uint64_t) ;
    if(strideElems == 0) strideElems = 1 ;
    
    for(size_t i = 0; i < elements; i++){
        size_t next = (i + strideElems)%elements ;
        arr[i] = (uint64_t)next ;
    }
    
    *out_arr = arr ;
    return elements ;
}


// iter jump chases
uint64_t chaseOnce(uint64_t *arr, size_t elements, uint64_t iters){
    uint64_t idx = 0 ;
    for(uint64_t i = 0; i < iters; ++i){
        idx = arr[idx] ;
    }
    return idx ;
}

void benchmarkPointerChase(size_t sizeBytes, size_t stride, uint64_t iters, int repeats){
    uint64_t *arr = NULL ;
    size_t elements = makeChaseList(sizeBytes, stride, &arr) ;
    if(!arr){
        fprintf(stderr, "alloc failed for pointer chase\n") ;
        return ;
    }
    
    // Touch Pages to fault in
    madvise(arr, elements * sizeof(uint64_t), MADV_WILLNEED) ;
    
    // Warmup
    for(int w = 0; w < DEFAULT_WARMUP; ++w) chaseOnce(arr, elements, iters/10) ;
    
    printf("#pointer_chase,sizeBytes=%zu,stride=%zu,iters=%" PRIu64 "\n", sizeBytes, stride, iters) ;
    
    for(int r = 0; r < repeats; ++r){
        uint64_t t0 = now_ns() ;
        uint64_t idx = chaseOnce(arr, elements, iters) ;
        uint64_t t1 = now_ns() ;
        uint64_t dt = t1 - t0 ;
        double nsPerAccess = (double)dt / (double)iters ;
        blackhole = idx ;
        printf("pc_repeat,%d,%zu,%zu,%" PRIu64 ",%f\n", r, sizeBytes, stride, dt, nsPerAccess) ;
        fflush(stdout) ;
    }
    free(arr) ;
}

// ---------------Streaming Bandwidth-----------------
void benchmarkStream(size_t sizeBytes, size_t strideBytes, double readWriteMix, uint64_t iters, int repeats){
    size_t elemSize = sizeof(double) ;
    size_t elements = sizeBytes/ elemSize ;
    if(elements < 1) elements = 1 ;

    double *A = alignedAllocPages(64, elements * elemSize) ;
    double *B = alignedAllocPages(64, elements * elemSize) ;
    if(!A || !B) {fprintf(stderr, "alloc failed\n"); return ;}

    for(size_t i = 0; i < elements; i++){A[i] = (double)(i & 0xffff) * 1.234; B[i] = (double)i * 3.21 ;}

    madvise(A, elements * elemSize, MADV_WILLNEED) ;
    madvise(B, elements * elemSize, MADV_WILLNEED) ;

    size_t strideElems = strideBytes / elemSize ;
    if(strideElems < 1) strideElems = 1 ;

    for(int w = 0; w < DEFAULT_WARMUP; ++w){
        for(size_t i = 0; i < elements; i += strideElems){
            B[i] = B[i] + A[i] ;
        }
    }

    printf("#stream,size=%zu,stride=%zu,readRatio=%f,iterations=%" PRIu64 "\n", sizeBytes, strideBytes, readWriteMix, iters) ;
    for(int r = 0; r < repeats; ++r){
        uint64_t t0 = now_ns() ;
        volatile double acc = 0.0 ;
        for(uint64_t it = 0; it < iters; ++it){
            for(size_t i = 0; i < elements; i += strideElems){
                if(readWriteMix >= 0.999){
                    acc += A[i] ;
                }else if(readWriteMix <= 0.001){
                    B[i] = (double)it ;
                }else{
                    double alpha = readWriteMix ;
                    B[i] = alpha * A[i] + (1.0 - alpha) * B[i] ;
                }
            }
        }
        uint64_t t1 = now_ns() ;
        uint64_t dt = t1 - t0 ;

        double bytesPerIter = 0.0 ;
        if(readWriteMix >= 0.999){
            bytesPerIter = (double)elements/strideElems * (double)elemSize ;
        }else if(readWriteMix <= 0.001){
            bytesPerIter = (double)elements/strideElems * (double)elemSize ;
        }else{
            bytesPerIter = (double)elements/strideElems * (double)elemSize * 2.0 ;
        }
        double totalBytes = bytesPerIter * (double)iters ;
        double giB = totalBytes / (1024.0 * 1024.0 * 1024.0) ;
        double seconds = (double)dt / 1e9 ;
        double gibPerS = giB/seconds ;
        blackhole = (uint64_t) acc ;
        printf("stream_repeat,%d,%zu,%zu,%" PRIu64 ",%" PRIu64 ",%f\n", r, sizeBytes, strideBytes, dt, (uint64_t)totalBytes, gibPerS) ;
        fflush(stdout) ;
    }
    free(A) ; free(B) ;
}

// ------------------SAXPY Kernel---------------------------
void benchmarkSAXPY(size_t sizeBytes, uint64_t iterations, int repeats){
    size_t elemSize = sizeof(double) ;
    size_t elements = sizeBytes / elemSize ;
    if(elements < 1) elements = 1 ;

    double *x = alignedAllocPages(64, elements * elemSize) ;
    double *y = alignedAllocPages(64, elements * elemSize) ;
    if(!x || !y){fprintf(stderr, "alloc failed\n"); return ;}

    for(size_t i = 0; i < elements; i++){x[i] = (double)(i+1) * 0.00123; y[i] = (double)(i+2)*0.0007;}
    madvise(x, elements * elemSize, MADV_WILLNEED) ;
    madvise(y, elements * elemSize, MADV_WILLNEED) ;

    double a = 1.234567 ;

    for(int w = 0; w < DEFAULT_WARMUP; ++w){
        for(size_t i = 0; i < elements; i++) y[i] = a * x[i] + y[i] ;
    }

    printf("#saxpy,size=%zu,iterations=%" PRIu64 "\n", sizeBytes, iterations) ;
    for(int r = 0; r < repeats; r++){
        uint64_t t0 = now_ns() ;
        volatile double acc = 0.0 ;
        for (uint64_t it = 0; it < iterations; ++it){
            for(size_t i = 0; i < elements; i++){
                y[i] = a * x[i] + y[i] ;
            }
        }
        uint64_t t1 = now_ns() ;
        uint64_t dt = t1 - t0 ;
        double flops = (double)elements * (double)iterations * 2.0 ;
        double gflop = flops / 1e9 ;
        double seconds = (double)dt/1e9 ;
        double gflopS = gflop/seconds ;

        double cpe = ((double)dt/1e9) * sysconf(_SC_CLK_TCK) / (double)(elements * iterations) ;
        blackhole = (uint64_t) acc ;
        printf("saxpy_repeat, %d,%zu,%" PRIu64 ",%" PRIu64 ",%f\n", r, sizeBytes, dt, (uint64_t)flops, gflopS) ;
        fflush(stdout) ;
    }
    free(x) ; free(y) ;
}

// ---------------------- Intensity (multi-thread) ----------------------
typedef struct {
    size_t size_bytes;
    size_t stride;
    uint64_t iterations;
    double read_write_mix;
    int thread_id;
    volatile int *stop_flag;
    double result_throughput_gib;
    double result_latency_ns;
} thread_arg_t;

void *worker_stream_thread(void *argptr) {
    thread_arg_t *arg = (thread_arg_t *)argptr;
    size_t elem_size = sizeof(double);
    size_t elements = arg->size_bytes / elem_size; if (elements<1) elements=1;
    double *A = alignedAllocPages(64, elements * elem_size);
    double *B = alignedAllocPages(64, elements * elem_size);
    if (!A || !B) { fprintf(stderr,"thread alloc fail\n"); return NULL; }
    for (size_t i=0;i<elements;i++){ A[i]=i*1.0; B[i]=i*2.0; }
    size_t stride_elems = arg->stride / elem_size; if (stride_elems<1) stride_elems = 1;

    // run for arg->iterations loops (not time-limited here)
    uint64_t t0 = now_ns();
    uint64_t ops = 0;
    for (uint64_t it=0; it<arg->iterations && !*(arg->stop_flag); ++it) {
        for (size_t i=0;i<elements;i+=stride_elems) {
            if (arg->read_write_mix >= 0.999) {
                volatile double v = A[i];
                blackhole = (uint64_t)v;
            } else if (arg->read_write_mix <= 0.001) {
                B[i] = (double)it;
            } else {
                double alpha = arg->read_write_mix;
                B[i] = alpha * A[i] + (1.0-alpha) * B[i];
            }
            ops++;
        }
    }
    uint64_t t1 = now_ns();
    double seconds = (double)(t1 - t0) / 1e9;
    double bytes_per_op = (arg->read_write_mix >= 0.999 || arg->read_write_mix <= 0.001) ? (double)elem_size : (double)elem_size*2.0;
    double total_bytes = bytes_per_op * (double)ops;
    arg->result_throughput_gib = (total_bytes / (1024.0*1024.0*1024.0)) / seconds;
    arg->result_latency_ns = (double)(t1 - t0) / (double)ops;
    free(A); free(B);
    return NULL;
}

void benchmark_intensity(size_t size_bytes, size_t stride, double mix, uint64_t iterations_per_thread, int max_threads) {
    printf("#intensity,size=%zu,stride=%zu,mix=%f,iter_per_thread=%" PRIu64 "\n", size_bytes, stride, mix, iterations_per_thread);
    for (int threads = 1; threads <= max_threads; threads *= 2) {
        pthread_t *tids = malloc(sizeof(pthread_t) * threads);
        thread_arg_t *targs = malloc(sizeof(thread_arg_t) * threads);
        volatile int stop = 0;
        for (int i=0;i<threads;i++) {
            targs[i].size_bytes = size_bytes;
            targs[i].stride = stride;
            targs[i].iterations = iterations_per_thread;
            targs[i].read_write_mix = mix;
            targs[i].thread_id = i;
            targs[i].stop_flag = &stop;
            targs[i].result_throughput_gib = 0.0;
            targs[i].result_latency_ns = 0.0;
            pthread_create(&tids[i], NULL, worker_stream_thread, &targs[i]);
        }
        // let them run until completion
        for (int i=0;i<threads;i++) pthread_join(tids[i], NULL);

        // aggregate
        double sum_gib = 0.0;
        double avg_lat_ns = 0.0;
        for (int i=0;i<threads;i++) {
            sum_gib += targs[i].result_throughput_gib;
            avg_lat_ns += targs[i].result_latency_ns;
        }
        avg_lat_ns /= (double)threads;
        printf("intensity_result,threads=%d,total_gib_s=%f,avg_lat_ns=%f\n", threads, sum_gib, avg_lat_ns);

        free(tids); free(targs);
    }
}

// ---------------------- Command-line interface ----------------------
void usage(const char *pname) {
    fprintf(stderr,
        "Usage: %s <mode> [options]\n"
        "Modes:\n"
        "  pc   : pointer-chase latency\n"
        "    opts: --size <bytes> --stride <bytes> --iters <jumps> --repeats <r>\n"
        "  stream : streaming bandwidth\n"
        "    opts: --size <bytes> --stride <bytes> --mix <read_ratio (0..1)> --iters <loops> --repeats <r>\n"
        "  saxpy : saxpy kernel\n"
        "    opts: --size <bytes> --iters <loops> --repeats <r>\n"
        "  intensity : multi-thread intensity sweep\n"
        "    opts: --size <bytes> --stride <bytes> --mix <0..1> --iters <per-thread> --maxthreads <2|4|8|..>\n"
        "\nExamples:\n"
        "  %s pc --size 65536 --stride 64 --iters 1000000\n"
        "  %s stream --size 8388608 --stride 8 --mix 0.5 --iters 10\n"
        "  %s saxpy --size 33554432 --iters 20\n"
        "  %s intensity --size 16777216 --stride 8 --mix 0.5 --iters 100 --maxthreads 8\n",
        pname, pname, pname, pname, pname);
}

int main(int argc, char **argv) {
    if (argc < 2) { usage(argv[0]); return 1; }
    const char *mode = argv[1];

    // defaults
    size_t size = 8 * 1024 * 1024; // 8 MiB
    size_t stride = 64;
    uint64_t iters = 100;
    int repeats = DEFAULT_REPEATS;
    double mix = 0.5;
    int maxthreads = 8;

    // parse args
    for (int i=2;i<argc;i++) {
        if (strcmp(argv[i], "--size")==0 && i+1<argc) { size = (size_t)atoll(argv[++i]); }
        else if (strcmp(argv[i], "--stride")==0 && i+1<argc) { stride = (size_t)atoll(argv[++i]); }
        else if (strcmp(argv[i], "--iters")==0 && i+1<argc) { iters = (uint64_t)atoll(argv[++i]); }
        else if (strcmp(argv[i], "--repeats")==0 && i+1<argc) { repeats = atoi(argv[++i]); }
        else if (strcmp(argv[i], "--mix")==0 && i+1<argc) { mix = atof(argv[++i]); }
        else if (strcmp(argv[i], "--maxthreads")==0 && i+1<argc) { maxthreads = atoi(argv[++i]); }
        else { fprintf(stderr,"Unknown arg: %s\n", argv[i]); usage(argv[0]); return 1; }
    }

    if (strcmp(mode,"pc")==0) {
        // choose a larger iters if small array to get enough samples
        uint64_t jumps = iters * 1000ull;
        if (size < 65536) jumps = iters * 100000ull;
        benchmarkPointerChase(size, stride, jumps, repeats);
    } else if (strcmp(mode,"stream")==0) {
        benchmarkStream(size, stride, mix, iters, repeats);
    } else if (strcmp(mode,"saxpy")==0) {
        benchmarkSAXPY(size, iters, repeats);
    } else if (strcmp(mode,"intensity")==0) {
        benchmark_intensity(size, stride, mix, iters, maxthreads);
    } else {
        fprintf(stderr,"Unknown mode: %s\n", mode);
        usage(argv[0]);
        return 1;
    }

    return 0;
}