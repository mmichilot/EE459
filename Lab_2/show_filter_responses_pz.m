function [Ak,Bk,HF,Fd,hn,n] = show_filter_responses_pz(poles, zeros, K, ...
                fsample, num_of_f_points, num_of_n_points, figure_num)
% function [Ak,Bk,HF,Fd,hn,n]=show_filter_responses_pz(poles, zeros, K, ...
%                fsample, num_of_f_points, num_of_n_points, figure_num)
% Analyzes and provides the frequency response plots for any FIR and IIR
% filter given the pole and zero locations
%
%   Arguments:
%   poles = a list of the Z plane locations (complex values) for all the 
%           POLES of the filter (a row vector)
%   zeros = a list of the Z plane locations (complex values) for all the 
%           ZEROS of the filter (a row vector)
%   K = Multiplier constant for the transfer function 
%       (which you should multiply H(z) by)
%   fsample = sampling frequency (samples / second)
%   num_of_f_points = the # of points for the freq. response plot
%   num_of_n_points = the # of points for the unit sample response plot
%   figure_num = number of the 1st figure to use for plots
%
%   Returns:
%   Ak = a list of the Ak coefficients of the filter difference equation 
%        (coefficients of the “y” terms)
%   Bk = a list of the Bk coefficients of the filter difference equation 
%        (coefficients of the “x” terms)
%   HF = the DTFT frequency response values (linear scale)
%   Fd = digital frequencies that match the freq response values
%   hn = has the unit sample response sequence values
%   n = has the corresponding sample indices (0 to [num_of_n_points – 1])
%
%   Depends:
%   unit_sample.m
%   unit_sample_response.m
%   plot_freq_responses.m

% Determine and print Ak and Bk coefficients
Ak = poly(poles);
Bk = poly(zeros);
Bk = K*Bk;
Ak
Bk

% Plot pole/zero diagram using zplane()
figure(figure_num);
zplane(zeros.', poles.');
grid on;
title('Pole/Zero Diagram');

% Generate H(F) using freqz()
[HF, W] = freqz(Bk, Ak, num_of_f_points);
Fd = W/(2*pi); % convert digital angular freq. to digital freq.

% Plot frequency responses using plot_freq_responses()
plot_freq_responses(Fd, HF, fsample, figure_num+1);
    
% Plot unit sample response using unit_sample_response()
[hn, n] = unit_sample_response(Bk, Ak, num_of_n_points, figure_num+3);

% Additional numerical evaluations
[peak_mag, peak_i] = max(abs(HF));
fprintf("Peak Magnitude Response = %.3f @ %.3f cycles/sample \n", ...
        peak_mag, Fd(peak_i));

[min_mag, min_i] = min(abs(HF));
fprintf("Minimum Magnitude Response = %.3f @ %.3f cycles/sample \n", ...
        min_mag, Fd(min_i));
    
max_attenuation = 20*log10(peak_mag - min_mag);
fprintf("Maximum Attenuation = %.3f \n", max_attenuation);

end

