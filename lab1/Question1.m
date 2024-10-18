% QUESTION 1
% Define the time vectors for each signal
k1 = -10:40;  % Range for x1
k2 = 0:99;    % Range for x2

% Generate the signals
x1 = -5.1 * sin(0.1 * pi * k1 - 3 * pi / 4) + 1.1 * cos(0.4 * pi * k1);
x2 = (-0.9).^k2 .* exp(1j * pi * k2 / 10);

% Calculate energy of both signals
x1Energy = sum(abs(x1).^2)
x2Energy = sum(abs(x2).^2)

% Plotting
figure;

% Plot x1[k] on the first subplot
subplot(3,1,1);
stem(k1, x1, 'b', 'filled', 'DisplayName', 'x1[k]'); 
title('Discrete Time Signal x1[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Plot the real part of x2[k] on the second subplot
subplot(3,1,2);
stem(k2, real(x2), 'r', 'DisplayName', 'Real part of x2');
title('Real Part of x2[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Plot the imaginary part of x2[k] on the third subplot
subplot(3,1,3);
stem(k2, imag(x2), 'g', 'filled', 'DisplayName', 'Imaginary part of x2');
title('Imaginary Part of x2[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Turn off hold
hold off;

% QUESTION 1 END
