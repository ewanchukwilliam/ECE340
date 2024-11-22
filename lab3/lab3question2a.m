% Define the coefficients for the transfer functions
numerator_H1 = [2, 2];        % Coefficients of H1(z)
denominator_H1 = [1, -1.25];  % Coefficients of H1(z)

numerator_H2 = [2, 2];        % Coefficients of H2(z)
denominator_H2 = [1, -0.8];   % Coefficients of H2(z)

% Convert transfer function to zero-pole-gain format
[zeros_H1, poles_H1, ~] = tf2zpk(numerator_H1, denominator_H1);
[zeros_H2, poles_H2, ~] = tf2zpk(numerator_H2, denominator_H2);

% Plot pole-zero diagrams
figure;
subplot(1, 2, 1);
zplane(zeros_H1, poles_H1);
title('Pole-Zero Diagram of H1(z)');
grid on;

subplot(1, 2, 2);
zplane(zeros_H2, poles_H2);
title('Pole-Zero Diagram of H2(z)');
grid on;

% Stability Analysis
% A system is stable if all poles are inside the unit circle
is_stable_H1 = all(abs(poles_H1) < 1);
is_stable_H2 = all(abs(poles_H2) < 1);

fprintf('System H1(z) Stability: %s\n', mat2str(is_stable_H1));
fprintf('System H2(z) Stability: %s\n', mat2str(is_stable_H2));
