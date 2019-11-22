void calculateMahalanobisDistance(glm::vec3 a,glm::vec3 b,float* covar) {
	float *covarInv = inverse(covar);
	float dist = (a - b)
}

void calculatePrior()

__global__ void calculateExpectation(int m,float *priorProb) {
	int index = (blockIdx.x * blockDim.x) + threadIdx.x;
	if (index >= N)
		return;


	float sum = 0;
	for (int i = 0; i < m; i++) {
		sum += calculatePrior(mean[i],covar[i],point[x]);
	}
}