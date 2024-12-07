% Define the signals
x1 = [2, 1, 1, 2, 0, 0, 0, 0]; % Zero-padded for N=8
x2 = [1, -1, -1, 1, 0, 0, 0, 0]; % Zero-padded for N=8

N = length(x1); % Length of input sequence

% (i) Compute the 8-point DFT of x1[n] and x2[n]
n = 0:N-1; % Time indices
k = 0:N-1; % Frequency indices

% Twiddle factor W_N = exp(-2*pi*i/N)
W = exp(-2*pi*1i/N); % Twiddle factor for N points
W_matrix = W.^(n' * k); % DFT matrix of size N x N

% Display the DFT matrix
disp('DFT Matrix W (N x N):');
disp(W_matrix);

% Compute the DFT using matrix multiplication (X1 = W_matrix * x1')
X1 = W_matrix * x1.'; % N x N * N x 1 => N x 1
X2 = W_matrix * x2.'; % N x N * N x 1 => N x 1

% Display the DFT results
disp('DFT of x1[n]:');
disp(X1);
disp('DFT of x2[n]:');
disp(X2);

% (ii) Multiply X1[k] and X2[k] element-wise
Y = X1 .* X2;

% Display the result of pointwise multiplication
disp('Element-wise multiplication (X1[k] * X2[k]):');
disp(Y);

% (iii) Compute the IDFT of Y[k]
% Inverse DFT is the conjugate transpose of W_matrix, scaled by 1/N
W_inv_matrix = conj(W_matrix) / N; % Conjugate transpose of the DFT matrix (inverse)

% Display the inverse DFT matrix
disp('Inverse DFT Matrix W_inv (N x N):');
disp(W_inv_matrix);

% IDFT of Y (Matrix multiplication: N x N * N x 1 => N x 1)
y = W_inv_matrix * Y; 

% Display the circular convolution result
disp('Circular Convolution Result y[n]:');
disp(y);

% Visualize the process
figure;
subplot(3,1,1);
stem(0:N-1, abs(X1), 'b', 'LineWidth', 1.5); % Magnitude of X1[k]
title('Magnitude of X1[k]');
xlabel('k'); ylabel('|X1[k]|');
grid on;

subplot(3,1,2);
stem(0:N-1, abs(X2), 'r', 'LineWidth', 1.5); % Magnitude of X2[k]
title('Magnitude of X2[k]');
xlabel('k'); ylabel('|X2[k]|');
grid on;

subplot(3,1,3);
stem(0:N-1, abs(Y), 'm', 'LineWidth', 1.5); % Magnitude of Y[k]
title('Magnitude of Y[k] (X1[k] * X2[k])');
xlabel('k'); ylabel('|Y[k]|');
grid on;

% Final result plot
figure;
stem(0:N-1, real(y), 'k', 'LineWidth', 1.5); % Circular Convolution Result
title('Circular Convolution Result y[n]');
xlabel('n'); ylabel('y[n]');
grid on;
