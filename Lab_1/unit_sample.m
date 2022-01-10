function  [dn, n] = unit_sample(number_of_samples)
%unit_sample Returns a unit sample sequence
%
%   number_of_samples = number of samples the should be returned

dn = zeros(1, number_of_samples);
dn(1) = 1;
n = 0:1:(number_of_samples-1);
end

