 % /*
 % ============================================================================
 % Name        : myrand.m
 % Author      : Mostafa Saleh
 % Version     : Matlab R2015a
 % Copyright   : Open source
 % Description : myrand to generate uniform R.V.
 % ============================================================================
 % */
function[uniform] = myrand(inital_seed , No_of_samples)
M = (2 ^ 31) - 1;
a = 125;
x = zeros(1 , No_of_samples + 1);
x(1 , 1) = inital_seed;
for i = 1 : No_of_samples
    x(1 , i + 1)  = mod(a * x(1 , i) , M); 
end
uniform = x / M;