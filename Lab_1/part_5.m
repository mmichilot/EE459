% Create time samples
Fs_200 = 0:1/200:0.5;
Fs_60  = 0:1/60:0.5;
Fs_20  = 0:1/20:0.5;
Fs_12  = 0:1/12:0.5;

% Anonymous function that represents our signal
A = 1;
f_a = 10;
x = @(t, theta) A*cos(2*pi*f_a*t + theta);

% Plot the signals
hold on
plot(Fs_200,x(Fs_200,pi/3), 'b', 'LineWidth', 4);
plot(Fs_60,x(Fs_60,pi/3), 'r', 'LineWidth', 3);
plot(Fs_20,x(Fs_20,pi/3), 'g', 'LineWidth', 2);
plot(Fs_20,x(Fs_20,pi/2), 'g--', 'LineWidth', 5);
plot(Fs_12,x(Fs_12,pi/3), 'k', 'LineWidth', 6);
grid on
xlabel('t [seconds]')
ylabel('x(t)')
title('Discrete-Time Sinusoidal Signals');


