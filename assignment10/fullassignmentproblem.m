% Define h[n] and x[n]
h = [1, 2, 3, 4];  % Impulse response
x = [2*ones(1, 5), 1*ones(1, 5), -2*ones(1, 5), 10*ones(1, 5), 3*ones(1, 5)];  % Input sequence

% Part (i): Compute the Linear Convolution y[n] = h[n] * x[n]
y = conv(x, h);

% Normalize the result of direct convolution
y = y / max(abs(y));

% Plot the result of direct convolution
n = 0:(length(y)-1); % Time index for direct convolution
figure;

subplot(3, 2, 1);
stem(n, y, 'filled');
title('Part (i): Linear Convolution: y[n] = h[n] * x[n]');
xlabel('n');
ylabel('y[n]');
grid on;

% Define parameters for Circular Convolution using Overlap-and-Save
N = 8; % Block size
L = length(h); % Length of h[n]
h_padded = [h, zeros(1, N - L)]; % Zero-pad h[n] to length N
H = fft(h_padded); % FFT of h[n]

% Split x[n] into overlapping blocks of size N
num_blocks = ceil(length(x) / (N - L + 1)); % Number of blocks
x_padded = [x, zeros(1, num_blocks * (N - L + 1) - length(x))]; % Pad x[n]
blocks = buffer(x_padded, N, L - 1, 'nodelay'); % Create overlapping blocks

% Initialize output for Circular Convolution
y_reconstructed = zeros(1, length(x) + L - 1);

% Process each block in the overlap-save method
for i = 1:size(blocks, 2)
    x_block = blocks(:, i)'; % Current block
    X_block = fft(x_block); % FFT of the block
    Y_block = H .* X_block; % Circular convolution in frequency domain
    y_block = ifft(Y_block); % Inverse FFT to get time-domain block
    start_idx = (i - 1) * (N - L + 1) + 1; % Starting index for overlap-save
    y_reconstructed(start_idx:start_idx + N - 1) = ...
        y_reconstructed(start_idx:start_idx + N - 1) + y_block;
end

% Normalize the circular convolution result
y_reconstructed = y_reconstructed / max(abs(y_reconstructed));

% Plot the result of Circular Convolution using Overlap-Save Method
n_reconstructed = 0:(length(y_reconstructed)-1); % Time index for overlap-save result

subplot(3, 2, 2);
stem(n_reconstructed, real(y_reconstructed), 'filled');
title('Part (ii): Circular Convolution Using Overlap-Save Method');
xlabel('n');
ylabel('y[n]');
grid on;

% Comparison between Linear Convolution and Circular Convolution
subplot(3, 2, 3);
stem(n, y, 'filled');
hold on;
stem(n_reconstructed, real(y_reconstructed), 'r--');
legend('Linear Convolution', 'Circular Convolution');
title('Part (ii)(e): Comparison of Linear and Circular Convolution');
xlabel('n');
ylabel('y[n]');
grid on;

% Plotting Part (ii) - Circular Convolution Step-by-Step

% (a) Input blocks xi[n]
x1 = x(1:N);
x2 = x(3:10);
x3 = x(5:12);
x4 = x(7:14);
x5 = x(9:16);

% Normalize input blocks
x1 = x1 / max(abs(x1));
x2 = x2 / max(abs(x2));
x3 = x3 / max(abs(x3));
x4 = x4 / max(abs(x4));
x5 = x5 / max(abs(x5));

subplot(3, 2, 4);
stem(1:N, x1, 'filled', 'DisplayName', 'x1[n]');
hold on;
stem(1:N, x2, 'r', 'DisplayName', 'x2[n]');
stem(1:N, x3, 'g', 'DisplayName', 'x3[n]');
stem(1:N, x4, 'b', 'DisplayName', 'x4[n]');
stem(1:N, x5, 'm', 'DisplayName', 'x5[n]');
title('Part (ii)(a): Input Blocks xi[n]');
xlabel('n');
ylabel('x_i[n]');
legend;
grid on;

% (b) FFT of input blocks
X1 = fft(x1, N);
X2 = fft(x2, N);
X3 = fft(x3, N);
X4 = fft(x4, N);
X5 = fft(x5, N);

% Normalize FFTs
X1 = X1 / max(abs(X1));
X2 = X2 / max(abs(X2));
X3 = X3 / max(abs(X3));
X4 = X4 / max(abs(X4));
X5 = X5 / max(abs(X5));

subplot(3, 2, 5);
stem(0:N-1, abs(X1), 'filled', 'DisplayName', 'X1[k]');
hold on;
stem(0:N-1, abs(X2), 'r', 'DisplayName', 'X2[k]');
stem(0:N-1, abs(X3), 'g', 'DisplayName', 'X3[k]');
stem(0:N-1, abs(X4), 'b', 'DisplayName', 'X4[k]');
stem(0:N-1, abs(X5), 'm', 'DisplayName', 'X5[k]');
title('Part (ii)(b): Magnitude of FFTs of Input Blocks');
xlabel('k');
ylabel('|X[k]|');
legend;
grid on;

% (c) Frequency-domain multiplication
Y1 = H .* X1;
Y2 = H .* X2;
Y3 = H .* X3;
Y4 = H .* X4;
Y5 = H .* X5;

% (d) Inverse FFT of output blocks
y1 = ifft(Y1, N);
y2 = ifft(Y2, N);
y3 = ifft(Y3, N);
y4 = ifft(Y4, N);
y5 = ifft(Y5, N);

% Normalize the inverse FFT results
y1 = y1 / max(abs(y1));
y2 = y2 / max(abs(y2));
y3 = y3 / max(abs(y3));
y4 = y4 / max(abs(y4));
y5 = y5 / max(abs(y5));

% subplot(3, 2, 6);
stem(0:N-1, real(y1), 'filled', 'DisplayName', 'y1[n]');
hold on;
stem(0:N-1, real(y2), 'r', 'DisplayName', 'y2[n]');
stem(0:N-1, real(y3), 'g', 'DisplayName', 'y3[n]');
stem(0:N-1, real(y4), 'b', 'DisplayName', 'y4[n]');
stem(0:N-1, real(y5), 'm', 'DisplayName', 'y5[n]');
title('Part (ii)(d): Inverse FFT of Output Blocks');
xlabel('n');
ylabel('y_i[n]');
legend;
grid on;

% Final remarks: All results plotted for analysis
