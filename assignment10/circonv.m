function [y] = circonv(x, h, N)
    % Check that x and h are of length N
    N2 = length(x);
    N3 = length(h);
    
    % Pad x and h to length N if necessary
    x = [x, zeros(1, N - N2)];
    h = [h, zeros(1, N - N3)];
    
    % Compute circular convolution using FFT
    y = ifft(fft(x) .* fft(h));
end
