#pragma once

#include <glm/glm.hpp>
#include <glm/vec3.hpp>
#include <vector>
#include <cuda.h>
#include <cstdio>
using namespace std;

namespace gpu {
	
	namespace SingleGMM {

        float calculateMahalanobisDistance(glm::vec3 a,glm::vec3 b,mat3 covar) {
	        glm::mat3 covarInv= glm::inverse(covar);
            glm::vec3 temp = (a-b) * covarInv;
	        float distance = glm::outerProduct(a-b,temp);
            return distance;
        }

        float calculatePrior(glm::vec3 mean,glm::mat3 covar, glm::vec3 point) {
            return exp(-0.5*calculateMahalanobisDistance(point,mean,covar));
        }

        _global__ void calculateExpectation(int m,int N,float *priorProb, glm::vec3 *points, glm::vec3 *mean, glm::mat3 *covar) {
	        int index = (blockIdx.x * blockDim.x) + threadIdx.x;
	        if (index >= N)
		        return;

	        float sum = 0;
	        for (int i = 0; i < m; i++) {
                priorProb[i] = calculatePrior(mean[i],covar[i],points[index]);
		        sum += priorProb[i];
	        }

            for (int i = 0; i < m; i++) {
                priorProb[i] = priorProb[i]/sum;
            }

        }

        __global__ void calculateMaximization(int m,float *priorProb, glm::vec3 *points, glm::vec3 mean, glm::mat3 *covar) {
            int index = (blockIdx.x * blockDim.x) + threadIdx.x;
	        if (index >= N)
		        return;

        }

	}
	
    namespace HierGMM {

    }
	
}
