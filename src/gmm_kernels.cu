#pragma once

#include <glm/glm.hpp>
#include <glm/vec3.hpp>
#include <glm/mat3.hpp>
#include <vector>
#include <cuda.h>
#include <cstdio>
#include<cuda.h>
#include "gmm_kernels.h"

#define checkCUDAErrorWithLine(msg) checkCUDAError(msg, __LINE__)

/**
* Check for CUDA errors; print and exit if there was a problem.
*/
void checkCUDAError(const char *msg, int line = -1) {
	cudaError_t err = cudaGetLastError();
	if (cudaSuccess != err) {
		if (line >= 0) {
			fprintf(stderr, "Line %d: ", line);
		}
		fprintf(stderr, "Cuda error: %s: %s.\n", msg, cudaGetErrorString(err));
		exit(EXIT_FAILURE);
	}
}

/*****************
* Configuration *
*****************/

/*! Block size used for CUDA kernel launch. */
#define blockSize 128

/*! Size of the starting area in simulation space. */
#define scene_scale 0.1f


/***********************************************
* Kernel state (pointers are device pointers) *
***********************************************/

int numObjects;
dim3 threadsPerBlock(blockSize);

// Buffers allocated for the logic
glm::vec3 *dev_points;


void expectationStep(glm::vec3 *data,glm::vec3 *mean, glm::mat3 *covar, float *priors, float *prob, int N) {
	
	int numObjects = N;
	dim3 fullBlocksPerGrid((numObjects + blockSize - 1) / blockSize);

	cudaMalloc((void**)&points, numObjects * sizeof(glm::vec3));
	checkCUDAErrorWithLine("cudaMalloc dev_points failed!");

}

void maximizationStep(glm::vec3 *data, glm::vec3 *mean, glm::mat3 *covar, float *priors, float *prob, int N) {

	int numObjects = N;
	dim3 fullBlocksPerGrid((numObjects + blockSize - 1) / blockSize);

	cudaMalloc((void**)&points, numObjects * sizeof(glm::vec3));
	checkCUDAErrorWithLine("cudaMalloc dev_points failed!");

}

void expectationStep(glm::vec2 *data, glm::vec2 *mean, glm::mat2 *covar, float *priors, float *prob, int N) {

	int numObjects = N;
	dim3 fullBlocksPerGrid((numObjects + blockSize - 1) / blockSize);

	cudaMalloc((void**)&points, numObjects * sizeof(glm::vec2));
	checkCUDAErrorWithLine("cudaMalloc dev_points failed!");

}

void maximizationStep(glm::vec2 *data, glm::vec2 *mean, glm::mat2 *covar, float *priors, float *prob, int N) {

	int numObjects = N;
	dim3 fullBlocksPerGrid((numObjects + blockSize - 1) / blockSize);

	cudaMalloc((void**)&points, numObjects * sizeof(glm::vec2));
	checkCUDAErrorWithLine("cudaMalloc dev_points failed!");

}