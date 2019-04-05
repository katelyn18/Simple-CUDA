/*
Problem 1: initialize array of size 32 to 0
Problem 2: change array size to 1024
Problem 3: create another kernel that adds i to array[ i ]
Problem 4: change array size 8000 (check answer to Problem 3 still works)
*/
#include <stdio.h>
#include <cuda.h>

//initialize array to 0
__global__ void kernel1( int N, int *d_array  ){
	for( int i = 0; i < N; i++ ){
		d_array[ i ] = 0;
	}
}

//add i to array[ i ]
__global__ void kernel2( int N, int *d_array ){
	for( int i = 0; i < N; i++ ){
		d_array[ i ] = i;
	}
}

int main(){
	
	int *array, *d_array; 
//DO NOT COMMENT OUT ANYTHING ABOVE THIS LINE


/*
	printf( "**********PROBLEM 1**********\n" );
	int N = 32; 
	array = (int*)malloc( N*sizeof(int) );
	cudaMalloc( &d_array, N*sizeof( int ) );

	kernel1<<<8, 128>>>( N, d_array );
	cudaMemcpy( array, d_array, N*sizeof(int), cudaMemcpyDeviceToHost );

	for( int i = 0; i < N; i++ ){
		printf( "array[ %d ] = %d ", i, array[ i ] );
		if( (i+1) % 4 == 0 ){
			printf( "\n" );
		}
	}
	//**********end problem 1**********
*/

/*
	printf( "**********PROBLEM 2**********\n" );
	int N2 = 1024;
	array = (int*)malloc( N2*sizeof(int) );
	cudaMalloc( &d_array, N2*sizeof(int) );

	kernel1<<<8, 128>>>( N2, d_array );
	cudaMemcpy( array, d_array, N2*sizeof(int), cudaMemcpyDeviceToHost );

	for( int i = 0; i < N2; i++ ){
		printf( "array[ %d ] = %d ", i, array[ i ] );
		if( (i+1) % 8 == 0 ){
			printf( "\n" );
		}
	}
	//**********end problem 2**********
*/

/*
	printf( "**********PROBLEM 3**********\n" );
	int N2 = 1024;
	array = (int*)malloc( N2*sizeof(int) );
	cudaMalloc( &d_array, N2*sizeof(int) );

	kernel2<<<8, 128>>>( N2, d_array );
	cudaMemcpy( array, d_array, N2*sizeof(int), cudaMemcpyDeviceToHost );

	for( int i = 0; i < N2; i++ ){
		printf( "array[ %d ] = %d ", i, array[ i ] );
		if( (i+1) % 8 == 0 ){
			printf( "\n" );
		}
	}
	//**********end problem 3**********
*/

	printf( "**********PROBLEM 4**********\n" );
	int N3 = 8000; 
	array = (int*)malloc( N3*sizeof(int) );
	cudaMalloc( &d_array, N3*sizeof(int) );

	kernel2<<<8, 128>>>( N3, d_array );
	cudaMemcpy( array, d_array, N3*sizeof(int), cudaMemcpyDeviceToHost );

	for( int i = 0; i < N3; i++ ){
		printf( "array[ %d ] = %d ", i, array[ i ] );
		if( (i+1) % 8 == 0 ){
			printf( "\n" );
		}
	}
	//**********end problem 4**********

//DO NOT COMMENT ANYTHING BELOW THIS LINE

	cudaFree( d_array );
	free( array );

	return 0;
}
