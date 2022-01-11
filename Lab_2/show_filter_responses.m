function [poles,zeros,HF,Fd,hn,n] = show_filter_responses(Ak, Bk, ...
            fsample, num_of_f_points, num_of_n_points, figure_num)
% function [poles,zeros,HF,Fd,hn,n] = show_filter_responses(Ak, Bk, ... 
%             fsample, num_of_f_points, num_of_n_points, figure_num)
% Analyzes and provides the frequency response plots for any FIR and IIR
% filter given the Ak and Bk coeffecients
%
%   Arguments:
%   Ak = a list of the Ak coefficients of the filter difference equation 
%        (coefficients of the “y” terms)
%   Bk = a list of the Bk coefficients of the filter difference equation 
%        (coefficients of the “x” terms)
%   fsample = sampling frequency (samples / second)
%   num_of_f_points = the # of points for the freq. response plot
%   num_of_n_points = the # of points for the unit sample response plot
%   figure_num = number of the 1st figure to use for plots
%
%   Returns:
%   poles = a list of the complex pole locations (z values) for the 
%           Transfer Function 
%           (the roots of the H(z) denominator polynomial)
%   zeros = a list of the complex zero locations (z values) for the 
%           Transfer Function (the roots of the H(z) numerator polynomial)
%   HF = the complex DTFT frequency response values (linear scale)
%   Fd = digital frequencies that match the freq response values
%   hn – has the unit sample response sequence values
%   n – has the corresponding sample indices (0 to [num_of_n_points – 1]);
%   
%   Depends:
%   unit_sample.m
%   unit_sample_response.m
%   plot_freq_responses.m

% Print poles and zeros
zeros = roots(Bk)
poles = roots(Ak)

% Plot pole/zero diagram using zplane()
figure(figure_num);
zplane(Bk, Ak);
grid on;
title('Pole/Zero Diagram');

% Generate H(F) using freqz()
[HF, W] = freqz(Bk, Ak, num_of_f_points);
Fd = W/(2*pi); % convert digital angular freq. to digital freq.

% Plot frequency responses using plot_freq_responses()
plot_freq_responses(Fd, HF, fsample, figure_num+1);
    
% Plot unit sample response using unit_sample_response()
[hn, n] = unit_sample_response(Bk, Ak, num_of_n_points, figure_num+3);
end

