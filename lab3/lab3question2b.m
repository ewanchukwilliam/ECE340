% Define the frequency range
omega = linspace(0, 2*pi, 1024);

% Compute frequency responses for H1(z) and H2(z)
H1 = polyval(numerator_H1, exp(1j*omega))...
    ./ polyval(denominator_H1, exp(1j*omega));
H2 = polyval(numerator_H2, exp(1j*omega))... 
    ./ polyval(denominator_H2, exp(1j*omega));

% Calculate magnitude and phase
magnitude_H1 = abs(H1);
phase_H1 = angle(H1);
magnitude_H2 = abs(H2);
phase_H2 = angle(H2);

% Plot magnitude and phase responses
figure;

% H1 Magnitude and Phase
subplot(2, 2, 1);
plot(omega, magnitude_H1);
title('Magnitude of H1(z)');
xlabel('\omega (rad/sample)');
ylabel('|H1(e^{j\omega})|');
grid on;

subplot(2, 2, 2);
plot(omega, phase_H1);
title('Phase of H1(z)');
xlabel('\omega (rad/sample)');
ylabel('∠H1(e^{j\omega}) (radians)');
grid on;

% H2 Magnitude and Phase
subplot(2, 2, 3);
plot(omega, magnitude_H2);
title('Magnitude of H2(z)');
xlabel('\omega (rad/sample)');
ylabel('|H2(e^{j\omega})|');
grid on;

subplot(2, 2, 4);
plot(omega, phase_H2);
title('Phase of H2(z)');
xlabel('\omega (rad/sample)');
ylabel('∠H2(e^{j\omega}) (radians)');
grid on;
