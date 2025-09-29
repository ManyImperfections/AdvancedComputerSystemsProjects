#include <iostream>
#include <vector>
#include <chrono>
#include <random>
#include <functional>
#include <cmath>

// Timing
double timeit(std::function<void()> f, int repeats=5){
	double best = 1e9;
	for(int i = 0; i<repeats;i++){
		auto start = std::chrono::high_resolution_clock::now();
		f();
		auto end = std::chrono::high_resolution_clock::now();
		double ms = std::chrono::duration<double, std::milli>(end-start).count();
		if(ms < best) best = ms ;
	}
	return best/1000.0 ;
}

// Data Type Comparison Scalar
template <typename T>
void saxpy_dataTyped_scalar(T a, const T* x, T* y, size_t N){
	for(size_t i = 0; i < N; i++){
		y[i] = a * x[i] + y[i] ;
	}
}

// Data Type Comparison Vector
template <typename T>
void saxpy_dataTyped_vector(T a, const T* x, T* y, size_t N){
	#pragma omp simd
	for(size_t i = 0; i < N; i++){
		y[i] = a * x[i] + y[i] ;
	}
}

// Strided
void saxpy_strided(float a, const float* x, float* y, size_t N, size_t stride=1){
	for(size_t i = 0; i<N; i+=stride){
		y[i] = a * x[i] + y[i] ;
	}
}

// Scalar
void saxpy_scalar(float a, const float* x, float* y, size_t N){
	for(size_t i = 0; i<N; i++){
		y[i] = a * x[i] + y[i] ;
	}
}

// Vectorized
void saxpy_vectorized(float a, const float* x, float* y, size_t N){
	#pragma omp simd
	for(size_t i = 0; i < N; i++){
		y[i] = a * x[i] + y[i] ;
	}
}

// Scalar
void element_scalar(const float* x, const float* y, float* result, size_t N){
	for(size_t i = 0; i < N; i++){
		result[i] = x[i] * y[i] ;
	}
}

// Vectorized
void element_vectorized(const float* x, const float* y, float* result, size_t N){
	#pragma omp simd
	for(size_t i = 0; i < N; i++){
		result[i] = x[i] * y[i] ;
	}
}

// Scalar
float dot_scalar(const float* x, const float* y, size_t N){
	float sum = 0.0;
	for(size_t i = 0; i < N ; i++){
		sum += x[i] * y[i] ;
	}
	return sum ;
}

// Vectorized
float dot_vectorized(const float* x, const float* y, size_t N){
	float sum = 0.0 ;
	#pragma omp simd reduction(+:sum)
	for(size_t i = 0; i < N ; i++){
		sum += x[i] * y[i] ;
	}
	return sum ;
}

// Speedup and GFLOP analysis
void test1(size_t N){
	std::vector<float> x(N), y(N), result(N) ;

	//randomize data
	std::default_random_engine engine(42) ;
	std::uniform_real_distribution<float> dist(0.0, 1.0) ;
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}

	// SAXPY timing
	double sax_scalar = timeit([&](){saxpy_scalar(2.0f, x.data(), y.data(), N); }) ;
	double sax_vector = timeit([&](){saxpy_vectorized(2.0f, x.data(), y.data(), N); }) ;

	double sax_flops = 2.0 * N;
	double sax_scalar_gflops = sax_flops / (sax_scalar * 1e9) ;
	double sax_vector_gflops = sax_flops / (sax_vector * 1e9) ;

	std::cout << std::to_string(sax_scalar/sax_vector) << "x     " ;
	std::cout << std::to_string(sax_scalar_gflops) << " " ;
	std::cout << std::to_string(sax_vector_gflops) << " " ;

	//randomize data again
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}
	
	// DOT multiply timing
	double DOT_scalar = timeit([&](){dot_scalar(x.data(), y.data(), N); }) ;
	double DOT_vector = timeit([&](){dot_vectorized(x.data(), y.data(), N); }) ;

	double DOT_flops = 2.0 * N;
	double DOT_scalar_gflops = DOT_flops / (DOT_scalar * 1e9) ;
	double DOT_vector_gflops = DOT_flops / (DOT_vector * 1e9) ;
	
	std::cout << std::to_string(DOT_scalar/DOT_vector) << "x         " ;
	std::cout << std::to_string(DOT_scalar_gflops) << "     " ;
	std::cout << std::to_string(DOT_vector_gflops) << " " ;


	//randomize data again
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}

	// Elementwise Multiply timing
	double ELEMENT_scalar = timeit([&](){element_scalar(x.data(), y.data(), result.data(), N); }) ;
	double ELEMENT_vector = timeit([&](){element_vectorized(x.data(), y.data(), result.data(), N); }) ;

	double ELEMENT_flops = 1.0 * N;
	double ELEMENT_scalar_gflops = ELEMENT_flops / (ELEMENT_scalar * 1e9) ;
	double ELEMENT_vector_gflops = ELEMENT_flops / (ELEMENT_vector * 1e9) ;

	std::cout << std::to_string(ELEMENT_scalar/ELEMENT_vector) << "x " ;
	std::cout << std::to_string(ELEMENT_scalar_gflops) << " " ;
	std::cout << std::to_string(ELEMENT_vector_gflops) << " \n" ;
}

// Alignment Analysis
void test2(){
	size_t N = 1e7 ;
	size_t N2 = 1e7+1;
	size_t N3 = 2e7 ;
	std::vector<float> x(N), y(N), result(N) ;

	//randomize data
	std::default_random_engine engine(42) ;
	std::uniform_real_distribution<float> dist(0.0, 1.0) ;
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}
	std::cout<< "SAXPY  " ;
	// Aligned
	double sax_scalar = timeit([&](){saxpy_scalar(2.0f, x.data(), y.data(), N); }) ;
	double sax_vector = timeit([&](){saxpy_vectorized(2.0f, x.data(), y.data(), N); }) ;
	std::cout << std::to_string(sax_scalar) << "  " << std::to_string(sax_vector) << "  " ;

	// Misaligned
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
	}	
	for(size_t i = 0; i < N2; i++){
		y[i] = dist(engine) ;
	}
	sax_scalar = timeit([&](){saxpy_scalar(2.0f, x.data(), y.data(), N); }) ;
	sax_vector = timeit([&](){saxpy_vectorized(2.0f, x.data(), y.data(), N); }) ;
	std::cout << std::to_string(sax_scalar) << "  " << std::to_string(sax_vector) << "  " ;

	// Multiples
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
	}	
	for(size_t i = 0; i < N3; i++){
		y[i] = dist(engine) ;
	}
	sax_scalar = timeit([&](){saxpy_scalar(2.0f, x.data(), y.data(), N); }) ;
	sax_vector = timeit([&](){saxpy_vectorized(2.0f, x.data(), y.data(), N); }) ;
	std::cout << std::to_string(sax_scalar) << "  " << std::to_string(sax_vector) << "  \n" ;


	//randomize data
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}
	std::cout<< "DOT  " ;
	// Aligned
	double DOT_scalar = timeit([&](){dot_scalar(x.data(), y.data(), N); }) ;
	double DOT_vector = timeit([&](){dot_vectorized(x.data(), y.data(), N); }) ;
	std::cout << std::to_string(DOT_scalar) << "  " << std::to_string(DOT_vector) << "  " ;

	// Misaligned
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
	}	
	for(size_t i = 0; i < N2; i++){
		y[i] = dist(engine) ;
	}
	DOT_scalar = timeit([&](){dot_scalar(x.data(), y.data(), N); }) ;
	DOT_vector = timeit([&](){dot_vectorized(x.data(), y.data(), N); }) ;
	std::cout << std::to_string(DOT_scalar) << "  " << std::to_string(DOT_vector) << "  " ;

	// Multiples
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
	}	
	for(size_t i = 0; i < N3; i++){
		y[i] = dist(engine) ;
	}
	DOT_scalar = timeit([&](){dot_scalar(x.data(), y.data(), N); }) ;
	DOT_vector = timeit([&](){dot_vectorized(x.data(), y.data(), N); }) ;
	std::cout << std::to_string(DOT_scalar) << "  " << std::to_string(DOT_vector) << "  \n" ;

	//randomize data
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}
	std::cout<< "ELEMENT  " ;
	// Aligned
	double ELEMENT_scalar = timeit([&](){element_scalar(x.data(), y.data(),result.data(), N); }) ;
	double ELEMENT_vector = timeit([&](){element_vectorized(x.data(), y.data(), result.data(), N); }) ;
	std::cout << std::to_string(ELEMENT_scalar) << "  " << std::to_string(ELEMENT_vector) << "  " ;

	// Misaligned
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
	}	
	for(size_t i = 0; i < N2; i++){
		y[i] = dist(engine) ;
	}
	ELEMENT_scalar = timeit([&](){element_scalar(x.data(), y.data(), result.data(), N); }) ;
	ELEMENT_vector = timeit([&](){element_vectorized(x.data(), y.data(), result.data(), N); }) ;
	std::cout << std::to_string(ELEMENT_scalar) << "  " << std::to_string(ELEMENT_vector) << "  " ;

	// Multiples
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
	}	
	for(size_t i = 0; i < N3; i++){
		y[i] = dist(engine) ;
	}
	ELEMENT_scalar = timeit([&](){element_scalar(x.data(), y.data(), result.data(), N); }) ;
	ELEMENT_vector = timeit([&](){element_vectorized(x.data(), y.data(), result.data(), N); }) ;
	std::cout << std::to_string(ELEMENT_scalar) << "  " << std::to_string(ELEMENT_vector) << "  \n" ;
}

// Stride/Gather Effects using only SAXPY
void test3(){
	size_t N = 1<<20 ;
	std::vector<float> x(N), y(N) ;

	// Random Values
	std::default_random_engine engine(42) ;
	std::uniform_real_distribution<float> dist(0.0, 1.0) ;
	for(size_t i = 0; i < N; i++){
		x[i] = dist(engine) ;
		y[i] = dist(engine) ;
	}

	// Stride values and computation
	std::vector<size_t> strides = {1, 2, 4, 8, 16, 32, 64} ;
	for(auto stride : strides){
		double time = timeit([&](){saxpy_strided(2.0, x.data(), y.data(), N, stride);}) ;

		// FLOPs
		double flops = 2.0 * (N / stride) ;
		double glops = flops / (time * 1e9) ;

		std::cout << std::to_string(stride) << " " << std::to_string(glops) << " " << std::to_string(time*1000) << std::endl ; 
	}

}

// Data Type Comparison
void test4(){
	size_t N = 1<<20 ;
	// Float Test
	std::vector<float> xf(N), yf(N) ;
	double f_flops = 2.0 * N;
	double float_time_scalar = timeit([&](){saxpy_dataTyped_scalar(2.0f, xf.data(), yf.data(), N);});
	double float_time_vector = timeit([&](){saxpy_dataTyped_vector(2.0f, xf.data(), yf.data(), N);});
	double float_speedup = float_time_scalar/float_time_vector ;
	double gflops_float_scalar = f_flops / (float_time_scalar*1e9) ;
	double gflops_float_vector = f_flops / (float_time_vector*1e9) ;
	std::cout << "Float " << std::to_string(float_speedup) << " " 
				<< std::to_string(gflops_float_scalar) << "  "
				<< std::to_string(gflops_float_vector) << std::endl;

	// Double Test
	std::vector<double> xd(N), yd(N) ;
	double d_flops = 2.0 * N;
	double double_time_scalar = timeit([&](){saxpy_dataTyped_scalar(2.0, xd.data(), yd.data(), N);});
	double double_time_vector = timeit([&](){saxpy_dataTyped_vector(2.0, xd.data(), yd.data(), N);});
	double double_speedup = double_time_scalar/double_time_vector ;
	double gflops_double_scalar = d_flops / (double_time_scalar*1e9) ;
	double gflops_double_vector = d_flops / (double_time_vector*1e9) ;
	std::cout << "Double " << std::to_string(double_speedup) << " " 
				<< std::to_string(gflops_double_scalar) << "  "
				<< std::to_string(gflops_double_vector) ;
}

int main(){
	/* 	Speedup and GFLOP analysis
	std::cout << "Arraysize  SAXPY_speedup SAXPY_GFLOP/s     DOT_speedup  DOT_GFLOP/s    ELEMENT_speedup  ELEMENT_GFLOP/s " << std::endl ;
	std::cout << "                         scalar   vector                scalar vector                   scalar vector  " <<std::endl;
	for(size_t i = 1; i <= 8; i++){
		std::cout << std::to_string(i) << "          " ;
		test(pow(10,i)) ;
	}
	*/

	/*  Alignment Analysis
	std::cout << "        Aligned         Unaligned       Multiples" << std::endl ;
	std::cout << "        scalar vector   scalar vector   scalar vector " << std::endl ;
	test2() ;
	*/

	/*  Stride Effects Analysis
	std::cout << "Stride     GFLOP/s     Time(ms)" << std::endl ;
	test3() ;
	*/

	std::cout << "Type    Speedup  GFLOP/s(scalar)    GFLOP/s(vector)\n" ;
	test4() ;
}