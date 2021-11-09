 % /*
 % ============================================================================
 % Name        : mygamma.m
 % Author      : Mostafa Saleh
 % Version     : Matlab R2015a
 % Copyright   : Open source
 % Description : mygamma to generate gamma R.V using an algorithm.
 % ============================================================================
 % */
function[gamma_numbers , len] = mygamma(uniform_numbers1 , uniform_numbers2 , k , theta , No_of_samples)
j = 0;
%Gamma disrubtion
for i = 1 : No_of_samples
    e = ((k - (1 / (6 * k))) * uniform_numbers1(i)) / ((k - 1) * uniform_numbers2(i));
    if (((2 * (uniform_numbers2(i) - 1)) / (k - 1)) + e + (1 / e)) <= 2
        j = j + 1;
        gamma_numbers(j) = e * (k - 1) * theta;
    else
        if (((2 * log(uniform_numbers2(i))) / (k - 1)) - log(e) + e) <= 1
            j = j + 1;
            gamma_numbers(j) = e * (k - 1) * theta;
        end
    end
end
len = length(gamma_numbers);