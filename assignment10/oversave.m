function [xi_blocks, y] = oversave(x, h, N)
    % Ensure N is larger than the length of h
    if (N < length(h))
        error("Length of N is too small compared to h");
    end
    
    Nx = length(x);  % Length of input signal
    M = length(h);   % Length of impulse response
    M1 = M - 1;      % M - 1
    L = N - M1;      % Overlap length
    x = [zeros(1, M-1), x, zeros(1, N-1)];  % Zero pad x[n]
    K = floor((Nx + M1 - 1) / L);  % Number of blocks
    y = zeros(K + 1, N);  % Initialize output matrix
    
    % Create a cell array to store input blocks
    xi_blocks = cell(1, K+1);  % Explicitly create xi_blocks as a cell array
    
    for i = 0:K
        % Extract each block and store in the cell array
        xi_blocks{i+1} = x(i * L + 1 : i * L + N);  % Store input blocks in xi_blocks
    end
    
    % Apply circular convolution to each block
    for i = 0:K
        xi = xi_blocks{i+1};  % Correctly access each block from the cell array
        y(i+1,:) = circonv(xi, h, N);  % Circular convolution for each block
    end
    
    % Final processing
    y = round(y);  % Round results
    y = y(:, M:N);  % Remove padding
    y = (y(:))';  % Convert the output to a row vector
end
