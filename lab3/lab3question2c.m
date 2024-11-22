% Define the time range for impulse responses
n = 0:25;

% Calculate the impulse responses using filter function
impulse_input = [1, zeros(1, 25)];  % Impulse input

h1_n = filter(numerator_H1, denominator_H1, impulse_input);
h2_n = filter(numerator_H2, denominator_H2, impulse_input);

% Plot the impulse responses
figure;

subplot(2, 1, 1);
stem(n, h1_n, 'filled');
title('Impulse Response h1(n)');
xlabel('n');
ylabel('h1(n)');
grid on;

subplot(2, 1, 2);
stem(n, h2_n, 'filled');
title('Impulse Response h2(n)');
xlabel('n');
ylabel('h2(n)');
grid on;

% Verify stability based on impulse responses
fprintf('h1(n) values: \n');
disp(h1_n);
fprintf('h2(n) values: \n');
disp(h2_n);
