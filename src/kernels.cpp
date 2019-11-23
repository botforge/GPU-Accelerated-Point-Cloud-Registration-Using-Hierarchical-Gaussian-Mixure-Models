#define GLM_FORCE_CUDA
#include <stdio.h>
#include <cuda.h>
#include <cmath>
#include <glm/glm.hpp>
#include "utilities.h"
#include "kernel.h"
#include "svd3.h"
#include <thrust/reduce.h>
#include "kdtree.h"
#include <glm/vec3.hpp>
#include <chrono>
#include <ctime>
#include <ratio>

void calculateMahalanobisDistance(glm::vec3 a,glm::vec3 b,float* covar) {
	float *covarInv = inverse(covar);
	float dist = (a - b);
}

void calculatePrior(){

}

__global__ void calculateExpectation(int m,float *priorProb, glm::vec3 *points, glm::vec3 *mean, float *covar) {
	int index = (blockIdx.x * blockDim.x) + threadIdx.x;
	if (index >= N)
		return;


	float sum = 0;
	for (int i = 0; i < m; i++) {
		sum += calculatePrior(mean[i],covar[i],points[x]);
	}
}