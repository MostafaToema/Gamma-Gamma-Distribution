 % /*
 % ============================================================================
 % Name        : Gamma_Gamma_dist_integration.m
 % Author      : Mostafa Saleh
 % Version     : Matlab R2015a
 % Copyright   : Open source
 % Description : used for prove the integration of PDF of Gamma Gamma distribution form 0 to infinity equal 1.
 % ============================================================================
 % */
%clear
clear;clc;close all;
N = 1e6;
limit = 5;
%Rytov variance
lambda = 1e-6;
k = 2 * pi / lambda;
ref_index = 1e-14;
L = 1e3;
variance = 1.23 * ref_index * k ^ (7 / 6) * L ^ (11 / 6);
%alpha and beta
alpha = 1 / (exp(0.49 * variance / (1 + 1.11 * variance ^ (6 / 5)) ^ (7 / 6)) - 1);
beta = 1 / (exp(0.51 * variance / (1 + 0.69 * variance ^ (6 / 5)) ^ (5 / 6)) - 1);
%Gamma Gamma distribution integration
I = limit * myrand(31 , N);
sum = sum((2 .* ((alpha .* beta) .^ ((alpha + beta) ./ 2)) .* (I .^ (((alpha + beta) ./ 2) - 1)) .* besselk((alpha - beta) , (2 .* sqrt(alpha .* beta .* I)))) / (gamma(alpha) * gamma(beta)));
area_under_PDF = (sum * limit) / N;
disp(area_under_PDF);