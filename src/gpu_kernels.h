#pragma once

using namespace std;

namespace gpu {
	
	namespace SingleGMM {

		float calculateMahalanobisDistance(glm::vec3 a, glm::vec3 b, mat3 covar;);

		float calculatePrior(glm::vec3 mean, glm::mat3 covar, glm::vec3 point);

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
	void createTree(vector<glm::vec3>& target,glm::vec4 *result);
	void insertNode(vector<glm::vec3>& value,glm::vec4 *result, int pos, int depth,int parent,int start, int end);
	//int calculateMaxDepth(vector<glm::vec3> value, int depth, int maxDepth);
}
