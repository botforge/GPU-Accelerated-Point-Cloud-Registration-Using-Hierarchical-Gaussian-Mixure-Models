#pragma once

#include <algorithm>
#include <istream>
#include <ostream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>
#include <glm/glm.hpp>
#include "cudaMat4.h"

void expectationStep(glm::vec3 *data, glm::vec3 *mean, glm::mat3 *covar, float *priors, float *prob, int N);
void maximizationStep(glm::vec3 *data, glm::vec3 *mean, glm::mat3 *covar, float *priors, float *prob, int N);
void expectationStep(glm::vec2 *data, glm::vec2 *mean, glm::mat2 *covar, float *priors, float *prob, int N);
void maximizationStep(glm::vec2 *data, glm::vec2 *mean, glm::mat2 *covar, float *priors, float *prob, int N);