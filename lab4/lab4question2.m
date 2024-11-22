% Load the audio file
[x, Fs] = audioread('love_mono22.wav');  
N = length(x);  % Total number of samples

% (a) Calculate the Discrete Fourier Transform (DFT) of the audio signal
X = fft(x);  % Compute the FFT of the signal
frequencies = (0:N-1)*(Fs/N);  % Frequency axis for the DFT in Hz

% (b) Extract values of X[0], X[1], and X[2]
X0 = X(1);  % First coefficient 
X1 = X(2);  % Second coefficient
X2 = X(3);  % Third coefficient
disp('Values of X[0], X[1], X[2]:');
disp(['X[0] = ', num2str(X0)]);
disp(['X[1] = ', num2str(X1)]);
disp(['X[2] = ', num2str(X2)]);

% (c) Scale the coefficients
X_scaled = X / sqrt(N);  % Scale the DFT coefficients

% (d) Plot the magnitude spectrum
magnitude_spectrum = abs(X_scaled);  % Magnitude of scaled DFT coefficients
magnitude_dB = 20 * log10(magnitude_spectrum) *2.3;  % Convert to decibels

% Scale frequency axis to KHz
frequencies_kHz = frequencies / 1000;

% Plot the magnitude spectrum in dB
figure;
% Plot positive frequencies
plot(frequencies_kHz(1:floor(N/2)+1), magnitude_dB(1:floor(N/2)+1)); 
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
title('Magnitude Spectrum of Audio Signal');
grid on;

