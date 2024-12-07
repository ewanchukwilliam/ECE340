% Define h[n] and x[n]
h = [1, 2, 3, 4]; % Impulse response
x = [2*ones(1, 5), 1*ones(1, 5), -2*ones(1, 5), 10*ones(1, 5), 3*ones(1, 5)]; % Input sequence

% Compute linear convolution
y = conv(x, h);

% Plot the result
n = 0:(length(y)-1); % Time index
figure;
stem(n, y, 'filled');
title('Linear Convolution: y[n] = h[n] * x[n]');
xlabel('n');
ylabel('y[n]');
grid on;

% Define parameters
N = 8; % Block size
L = length(h); % Length of h[n]
h_padded = [h, zeros(1, N - L)]; % Zero-pad h[n] to length N
H = fft(h_padded); % FFT of h[n]

% Split x[n] into overlapping blocks of size N
num_blocks = ceil(length(x) / (N - L + 1)); % Number of blocks
x_padded = [x, zeros(1, num_blocks * (N - L + 1) - length(x))]; % Pad x[n]
blocks = buffer(x_padded, N, L - 1, 'nodelay'); % Create overlapping blocks

% Initialize output
y_reconstructed = zeros(1, length(x) + L - 1);

% Process each block
for i = 1:size(blocks, 2)
    x_block = blocks(:, i)'; % Current block
    X_block = fft(x_block); % FFT of the block
    Y_block = H .* X_block; % Circular convolution in frequency domain
    y_block = ifft(Y_block); % Inverse FFT to get time-domain block
    start_idx = (i - 1) * (N - L + 1) + 1; % Starting index for overlap-save
    y_reconstructed(start_idx:start_idx + N - 1) = ...
        y_reconstructed(start_idx:start_idx + N - 1) + y_block;
end

% Plot the result
n = 0:(length(y_reconstructed)-1);
figure;
stem(n, real(y_reconstructed), 'filled');
title('Circular Convolution Using Overlap-Save Method');
xlabel('n');
ylabel('y[n]');
grid on;

% Compare with direct convolution
figure;
stem(0:(length(y)-1), y, 'filled');
hold on;
stem(n, real(y_reconstructed), 'r--');
legend('Linear Convolution', 'Circular Convolution');
title('Comparison of Linear and Circular Convolution');
xlabel('n');
ylabel('y[n]');
grid on;