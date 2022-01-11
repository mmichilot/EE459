function [hn, n] = unit_sample_response(Bk, Ak, number_of_samples, ...
                    figure_number)
% function [hn, n]=unit_sample_response(Bk, Ak, number_of_samples, ...
%                   figure_number)
% Plots and returns a unit sample response sequence
%
%   Arguments:
%   Bk = a list of the B k coefficients of the filter difference equation
%        (coefficients of the “x” terms)
%   Ak = a list of the A k coefficients of the filter difference equation
%        (coefficients of the “y” terms)
%   number_of_samples = # of unit sample response sequence samples to find
%   figure_number = # figure for the hn sequence plot
%
%   Returns:
%   hn = has the unit sample response sequence values
%   n = has the corresponding sample indices (starting at 0);
%
%   Depends:
%   unit_sample.m

% Generate unit sample sequence x[n]
[xn, n] = unit_sample(number_of_samples);

% Generate unit sample response sequence h[n] via filter()
hn = filter(Bk, Ak, xn);

% Plot h[n]
figure(figure_number)
stem(n, hn, '.')
grid on
xlabel('n')
ylabel('h[n]')
title('Unit Sample Response h[n]')



end