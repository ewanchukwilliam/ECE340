% Given sequences
x1 = [2, 1, 1, 2];    % Sequence x1[n]
x2 = [1, -1, -1, 1];  % Sequence x2[n]

% Define the N value for the DFT and IDFT
N = 8;

% Pad the sequences to length N
x1_padded = [x1, zeros(1, N-length(x1))];
x2_padded = [x2, zeros(1, N-length(x2))];

% (i) Compute the 8-point DFT of x1[n] and x2[n]
X1 = fft(x1_padded, N);  % DFT of x1[n]
X2 = fft(x2_padded, N);  % DFT of x2[n]

% Display the DFTs
fprintf('DFT of x1[n] (X1[k]):\n');
disp(X1);
fprintf('DFT of x2[n] (X2[k]):\n');
disp(X2);

% (ii) Compute the DFT of the circular convolution (pointwise multiplication in frequency domain)
Y = X1 .* X2;  % Y[k] = X1[k] * X2[k]

% Display the result in frequency domain
fprintf('Product of DFTs (Y[k] = X1[k] * X2[k]):\n');
disp(Y);

% (iii) Compute the inverse DFT of Y[k] to get the circular convolution result y[n]
y = ifft(Y, N);  % Inverse DFT of Y[k]

% Display the time-domain result
fprintf('Circular Convolution Result y[n] (using DFT method):\n');
disp(real(y));  % The real part of the IDFT is the result

% Visualizing the result
figure;
stem(0:N-1, real(y), 'filled');
title('Circular Convolution Result y[n] (from DFT and IDFT)');
xlabel('n');
ylabel('y[n]');
grid on;
