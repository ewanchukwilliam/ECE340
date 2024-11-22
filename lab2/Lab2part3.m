
fs1 = 100;            % Sampling frequency in Hz
n1 = 0:30;            % Discrete time index from 0 to 30
Ts = 1/fs1;           % Sampling period

% Define the signals
y1 = cos(0.2 * pi * n1);   % y1[n] = cos(0.2 * pi * n)
y2 = cos(1.8 * pi * n1);   % y2[n] = cos(1.8 * pi * n)


figure;
% Plot y1[n]
subplot(2, 1, 1);
stem(n1, y1, 'filled');  % Stem plot for y1[n]
title('y1[n] = cos(20πn) at 100Hz');
% xlabel('n');
ylabel('y1[n]');
grid on;

% Plot y2[n]
subplot(2, 1, 2);
stem(n1, y2, 'filled');  % Stem plot for y2[n]
title('y2[n] = cos(180πn) at 100Hz');
xlabel('n');
ylabel('y2[n]');
grid on;

% Part b starts here
fs2 = 1000;            % Sampling frequency in Hz
n2 = 0:300;            % Discrete time index from 0 to 300
Ts = 1/fs2;            % Sampling period

% Define the signals
z1 = cos(0.02 * pi * n2);   % z1[n] = cos(0.02 * pi * n)
z2 = cos(0.18 * pi * n2);   % z2[n] = cos(0.18 * pi * n)

% Create stem plots
figure;

% Plot z1[n]
subplot(2, 1, 1);
stem(n2, z1, 'filled');  % Stem plot for z1[n]
title('z1[n] = cos(20πn) 1000Hz');
xlabel('n');
ylabel('z1[n]');
grid on;

% Plot z2[n]
subplot(2, 1, 2);
stem(n2, z2, 'filled');  % Stem plot for z2[n]
title('z2[n] = cos(180πn) 1000Hz');
xlabel('n');
ylabel('z2[n]');
grid on;

figure;
subplot(2,1,1);
plot(n2/fs2, z1, 'r-', n1/fs1, y1, 'b+');
xlabel('n'); ylabel('y_1[n] and z_1[n]');
legend('z_1[n]', 'y_1[n]');

subplot(2,1,2);
plot(n2/fs2, z2, 'r-', n1/fs1, y2, 'b+');
xlabel('n'); ylabel('y_2[n] and z_2[n]');
legend('z_2[n]', 'y_2[n]');

% Given parameters for part c
fs3 = 100;  % Sampling frequency in Hz
n3 = 0:30;   % Sample indices for y1 and y3

% y3[n] corresponds to the new continuous-time signal x3(t)
y3 = cos(220 * pi * n3 * (1/fs3));  % Example signal for x3(t)

% Create stem plots
figure;

% Plot z1[n]
subplot(2, 1, 1);
stem(n3, y1, 'filled');  % Stem plot for z1[n]
title('y1[n] = cos(20πn) at 100Hz');
xlabel('n');
ylabel('y1[n]');
grid on;

% Plot z2[n]
subplot(2, 1, 2);
stem(n3, y3, 'filled');  % Stem plot for z2[n]
title('y3[n]= cos(220πn) at 100Hz');
xlabel('n');
ylabel('y3[n]');
grid on;
