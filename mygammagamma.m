 % /*
 % ============================================================================
 % Name        : mygammagamma.m
 % Author      : Mostafa Saleh
 % Version     : Matlab R2015a
 % Copyright   : Open source
 % Description : mygammagamma to generate gamma gamma R.V.
 % ============================================================================
 % */
function[gamma_gamma_numbers , len] = mygammagamma(uniform1 , uniform2 , uniform3 , uniform4 , k1 , theta1 , k2 , theta2 ,  No_of_samples)
%Gamma_numbers
[gamma_numbers1 , len1] = mygamma(uniform1 , uniform2 , k1 , theta1 , No_of_samples);
[gamma_numbers2 , len2] = mygamma(uniform3 , uniform4 , k2 , theta2 , No_of_samples);
%minimum length
min_len = min(len1 , len2);
%Gamma_Gamma_numbers
gamma_gamma_numbers = gamma_numbers1(1 : min_len) .* gamma_numbers2(1 : min_len);
len = length(gamma_gamma_numbers);