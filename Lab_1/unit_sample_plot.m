% Use the unit_sample function
num_samples = 16;
[dn, n] = unit_sample(num_samples);

% Plot unit sample
stem(n, dn, 'r.')
grid on
xlabel('n')
ylabel('x[n]')
title('Plot of Unit Sample')