% Signal
x = [1, 1, -1, -1]; 

% Parameters
N = length(x); % Period of the signal
X_k = zeros(1, N); % Initialize the coefficients

% Compute DFS coefficients
for k = 0:N-1
    for n = 0:N-1
        X_k(k+1) = X_k(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
    end
    X_k(k+1) = X_k(k+1) m; % Scale by 1/N
end

% Display the coefficients
disp('Discrete Fourier Series Coefficients (Manual Calculation):');
disp(X_k);
