function  [dn, n] = unit_sample(number_of_samples)
% function  [dn, n] = unit_sample(number_of_samples)
% Returns a unit sample sequence
%   
%   Arguments:
%   number_of_samples = number of samples the should be returned
%
%   Returns:
%   dn = has the unit sample sequence values 
%   n = has the sample index values (starting at 0) corresponding 
%       to each of the dn samples 

dn = zeros(1, number_of_samples);
dn(1) = 1;
n = 0:1:(number_of_samples-1);
end

