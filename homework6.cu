
#include <stdio.h>
#include <cuda.h>
#define N 32

__global__ void square( unsigned *h_matrix ){
        unsigned id = threadIdx.x * blockDim.y + threadIdx.y;
        h_matrix[id] = id * id;
}

int main() {

        dim3 block(N, N);
        //creating the matrix variables
        unsigned *matrix, *h_matrix;
        //initializing the variables
        matrix = (unsigned *)malloc(N * N * sizeof(unsigned));
        cudaMalloc(&h_matrix, N * N * sizeof(unsigned));
        //squaring the matrix
        square<<<1, block>>>(h_matrix);
        //copying the memory over
        cudaMemcpy( matrix, h_matrix, N * N * sizeof(unsigned), cudaMemcpyDeviceToHost );
        //print out the matrix
        for( int i = 0; i < N; i++ ){
                for( int j = 0; j < N; j++ ){
                        printf( "%d\t", matrix[ i * N + j ] );
                }
                printf( "\n" );
        }

        return 0;
}


















