#pragma once

#include <glm/glm.hpp>
#include <glm/vec3.hpp>
#include <vector>
#include <cuda.h>
#include <cstdio>
#include<cuda.h>

class GMM {
	
	int components;

	public:
		GMM(int N) {
			components = N;
		}

		void solve(glm::vec3 *points,glm::vec3 *mean, gm::mat3 *covar, int iterations,int N);
		void solve(glm::vec2 *points,glm::vec2 *mean, gm::mat2 *covar, int iterations,int N);
};