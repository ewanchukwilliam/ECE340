% Parameters for the impulse response
n = 0:10; % Define a range for n (0 to 20)
decay_factor = 0.5;          % Exponential decay base
frequency = pi / 6;          % Oscillation frequency in radians

% Calculate the impulse response h(n)
h_n = n .* (decay_factor .^ n) .* sin(frequency * n);

% Plot the impulse response h(n)
figure;
stem(n, h_n, 'filled', 'MarkerFaceColor', 'b');
xlabel('n');
ylabel('h(n)');
title('Impulse Response h(n) = n (0.5)^n sin(\pi n / 6) u(n)');
grid on;
