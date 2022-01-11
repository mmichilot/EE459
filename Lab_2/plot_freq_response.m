function plot_freq_response(Fd, HF, fsample, figure_num)
% function plot_freq_response(Fd, HF, fsample, figure_num)
% Plots the frequency response of H(F)
%
%   Outputs:
%   Fd = an array of digital frequency values (in units of 
%        cycles/sample) that correspond to the H(F) frequency 
%        response data values 
%   HF = an array of complex H(F) DTFT frequency response values to 
%        plot 
%   fsample = sampling frequency (in units of samples / second) 
%   figure_num = number of the 1st figure to use for the two plots 

figure(figure_num);

%% Plot the Magnitude Response (Linear)
subplot(2,1,1);

% Plot the magnitude of HF on a linear scale
plot(Fd, abs(HF));
grid on
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Magnitude Response')
title('Frequency Response of Filter')

%% Plot the Phase Response (Linear)
subplot(2,1,2);

% Plot the Phase Angle vs Frequency     
% Normalized angle radian values by pi radians
plot(Fd, (angle(HF)./pi), 'g', 'LineWidth', 2)
grid on
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Phase Response /pi')
ylim([-1 1])


figure(figure_num+1);

%% Plot the Magnitude Response (Log)
subplot(2,1,1);

% Plot the magnitude of HF on a linear scale
plot(fsample*Fd, 20*log10(abs(HF)));
grid on
xlabel('Analog Frequency  f (Hz)')
ylabel('Magnitude Response (dB)')
title('Frequency Response of Filter')

%% Plot the Phase Response (Linear)
subplot(2,1,2);

% Plot the Phase Angle vs Frequency     
% Normalized angle radian values by pi radians
plot(fsample*Fd, (angle(HF)./pi), 'g', 'LineWidth', 2)
grid on
xlabel('Analog Frequency f (Hz)')
ylabel('Phase Response /pi')
ylim([-1 1])

end

