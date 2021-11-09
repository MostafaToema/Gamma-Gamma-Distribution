 % /*
 % ============================================================================
 % Name        : Gamma_dist.m
 % Author      : Mostafa Saleh
 % Version     : Matlab R2015a
 % Copyright   : Open source
 % Description : used for plot the PDF of Gamma distribution theoritical and Monte Carlo method.
 % ============================================================================
 % */
%clear
clear;clc;close all;
N = 1e6;
k = 2;
theta = 2;
%theoritical Gamma disrubtion
x = 0 : .01 : 20;
fun = ((x .^ (k - 1)) .* exp(-x ./ theta) * (theta ^ -k)) / (gamma(k));
plot(x , fun , 'r' , 'linewidth' , 3);
hold on;
%genertate uniform random variables
uniform1 = myrand(31 , N);
uniform2 = myrand(127 , N);
%Gamma disrubtion
[gamma_numbers , len] = mygamma(uniform1 , uniform2 , k , theta , N);
%PDF TEST
[z , y] = hist(gamma_numbers , 100);
step = (y(2) - y(1));
%probability_of_step = z / len;
height = (z / len) / step ;
bar(y , height);
%Finish
xlabel('x');
ylabel('PDF(x)');
legend('theoritical' , 'Monte Carlo');
title(['PDF of Gamma distribution k = ' , num2str(k),' & theta = ' , num2str(theta)]);