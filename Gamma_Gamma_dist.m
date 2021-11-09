 % /*
 % ============================================================================
 % Name        : Gamma_Gamma_dist.m
 % Author      : Mostafa Saleh
 % Version     : Matlab R2015a
 % Copyright   : Open source
 % Description : used for plot the PDF of Gamma Gamma distribution theoritical and Monte Carlo method.
 % ============================================================================
 % */
%clear
clear;clc;close all;
N = 1e6;
%Rytov variance
lambda = 1e-6;
k = 2 * pi / lambda;
ref_index = 1e-14;
L = 1e3;
variance = 1.23 * ref_index * k ^ (7 / 6) * L ^ (11 / 6);
%alpha and beta
alpha = 1 / (exp(0.49 * variance / (1 + 1.11 * variance ^ (6 / 5)) ^ (7 / 6)) - 1);
beta = 1 / (exp(0.51 * variance / (1 + 0.69 * variance ^ (6 / 5)) ^ (5 / 6)) - 1);
%parameters of gamma distribution
k1 = alpha;
theta1 = 1 / alpha ;
k2 = beta ;
theta2 = 1 / beta;
%theoritical Gamma-Gamma disrubtion
I = 0 : .01 : 5;
fun =  (2 .* ((alpha .* beta) .^ ((alpha + beta) ./ 2)) .* (I .^ (((alpha + beta) ./ 2) - 1)) .* besselk((alpha - beta) , (2 .* sqrt(alpha .* beta .* I)))) / (gamma(alpha) * gamma(beta));
plot(I , fun , 'r' , 'linewidth' , 3);
hold on;
%genertate uniform random variables
uniform1 = myrand(31 , N);
uniform2 = myrand(127 , N);
uniform3 = myrand(37 , N);
uniform4 = myrand(137 , N);
%Gamma_Gamma distirbution
[gamma_gamma_numbers , len] = mygammagamma(uniform1 , uniform2 , uniform3 , uniform4 , k1 , theta1 , k2 , theta2 , N);
%PDF TEST
[z , y] = hist(gamma_gamma_numbers , 100);
step = (y(2) - y(1));
%probability_of_step = z / len;
height = (z / len) / step ;
bar(y , height);
%mean and variance
m = mean(gamma_gamma_numbers);
v = var(gamma_gamma_numbers(:));
%Finish
xlabel('signal intensity (I)');
ylabel('PDF(I)');
legend('theoritical' , 'Monte Carlo');
title(['PDF of Gamma Gamma distribution , alpha = ' , num2str(alpha) , ' & beta = ' , num2str(beta) , ' , with mean = ' , num2str(m) , ' , and variance = ' , num2str(v)]);