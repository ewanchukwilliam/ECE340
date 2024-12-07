% Assignment Solution
% Define h[n] and x[n]
h = [1, 2, 3, 4]; % Impulse response
x = [2*ones(1,5), ones(1,5), -2*ones(1,5), 3*ones(1,5)]; % Input signal

% Parameters
N = 8; % Block size
L = length(h); % Length of impulse response
P = N - L + 1; % Number of samples per block after overlap
num_blocks = ceil(length(x) / P); % Total number of blocks

% (i) Linear Convolution
disp('=== Part (i): Linear Convolution ===');
y_linear = conv(x, h); % Compute linear convolution
disp('Linear Convolution y[n]:');
fprintf('%6s\n', 'y[n]');
fprintf('------------------------------------\n');
fprintf('%6.2f\n', y_linear);

% (ii) Overlap-Save Method
% (a) Split x[n] into blocks xi[n]
disp('=== Part (ii.a): Input Blocks ===');
x_padded = [zeros(1, L-1), x, zeros(1, mod(-length(x), P))]; % Pad with zeros
x_blocks = zeros(num_blocks, N);

for i = 1:num_blocks
    start_idx = (i-1)*P + 1;
    x_blocks(i, :) = x_padded(start_idx:start_idx+N-1);
end
disp('Input Blocks x_i[n]:');
fprintf('%6s  ', 'Block #');
for col = 1:N
    fprintf('x[%d]  ', col-1);
end
fprintf('\n');
fprintf('------------------------------------\n');
for i = 1:num_blocks
    fprintf('%6d  ', i);
    fprintf('%6.2f  ', x_blocks(i, :));
    fprintf('\n');
end

% (b) FFT of each input block
disp('=== Part (ii.b): FFT of Input Blocks ===');
X_blocks = fft(x_blocks, N, 2); % FFT along rows
disp('FFT of Input Blocks X_i[k]:');
fprintf('%6s  ', 'Block #');
for col = 1:N
    fprintf('X[%d]  ', col-1);
end
fprintf('\n');
fprintf('------------------------------------\n');
for i = 1:num_blocks
    fprintf('%6d  ', i);
    fprintf('%6.2f + %6.2fi  ', real(X_blocks(i, :)), imag(X_blocks(i, :)));
    fprintf('\n');
end

% (c) FFT of h[n] and compute output blocks Yi[k]
disp('=== Part (ii.c): FFT of Output Blocks ===');
H = fft(h, N); % FFT of h[n]
Y_blocks = X_blocks .* H; % Element-wise multiplication in frequency domain
disp('FFT of Output Blocks Y_i[k]:');
fprintf('%6s  ', 'Block #');
for col = 1:N
    fprintf('Y[%d]  ', col-1);
end
fprintf('\n');
fprintf('------------------------------------\n');
for i = 1:num_blocks
    fprintf('%6d  ', i);
    fprintf('%6.2f + %6.2fi  ', real(Y_blocks(i, :)), imag(Y_blocks(i, :)));
    fprintf('\n');
end

% (d) Inverse FFT of Yi[k] to find yi[n]
disp('=== Part (ii.d): Inverse FFT to Find Output Blocks ===');
y_blocks = ifft(Y_blocks, N, 2); % Inverse FFT
disp('Output Blocks y_i[n]:');
fprintf('%6s  ', 'Block #');
for col = 1:N
    fprintf('y[%d]  ', col-1);
end
fprintf('\n');
fprintf('------------------------------------\n');
for i = 1:num_blocks
    fprintf('%6d  ', i);
    fprintf('%6.2f  ', real(y_blocks(i, :)));
    fprintf('\n');
end

% (e) Overlap-save reconstruction
disp('=== Part (ii.e): Reconstructed Output y[n] ===');
y_reconstructed = zeros(1, (num_blocks-1)*P + N);

for i = 1:num_blocks
    start_idx = (i-1)*P + 1;
    y_reconstructed(start_idx:start_idx+P-1) = ...
        y_blocks(i, L:N); % Discard first (L-1) samples
end
y_reconstructed = y_reconstructed(1:length(y_linear)); % Match length to y_linear
disp('Reconstructed Output y[n] from Overlap-Save:');
fprintf('%6s\n', 'y[n]');
fprintf('------------------------------------\n');
fprintf('%6.2f\n', y_reconstructed);

% Compare linear convolution and overlap-save result
difference = y_linear - y_reconstructed;

% Plot results
figure;

% Plot linear convolution
subplot(3, 1, 1);
stem(0:length(y_linear)-1, y_linear, 'filled', 'MarkerSize', 4, 'LineWidth', 1.5);
title('Part (i): Linear Convolution y[n]');
xlabel('n', 'FontSize', 12);
ylabel('y[n]', 'FontSize', 12);
grid on;

% Plot reconstructed overlap-save output
subplot(3, 1, 2);
stem(0:length(y_reconstructed)-1, y_reconstructed, 'filled', 'MarkerSize', 4, 'LineWidth', 1.5);
title('Part (ii.e): Reconstructed Output y[n] Using Overlap-Save');
xlabel('n', 'FontSize', 12);
ylabel('y[n]', 'FontSize', 12);
grid on;

% Plot difference
subplot(3, 1, 3);
stem(0:length(difference)-1, difference, 'filled', 'MarkerSize', 4, 'LineWidth', 1.5);
title('Difference Between Linear Convolution and Overlap-Save Output');
xlabel('n', 'FontSize', 12);
ylabel('Error', 'FontSize', 12);
grid on;
