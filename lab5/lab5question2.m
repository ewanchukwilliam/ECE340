% Parameters
fc = 5000; % Cutoff frequency for highpass filter in Hz
Fs = 22050; % Sampling frequency in Hz
N = 513; % Filter order (number of taps)

% Normalized cutoff frequency
wc = fc / (Fs / 2);

% Truncation window function (Hamming)
window = hamming(N);

% Highpass FIR filter design
filter_coeff = fir1(N-1, wc, 'high', window);

% Plot frequency response
figure;
freqz(filter_coeff, 1, 1024); % Frequency response
title('Frequency Response of Highpass FIR Filter');

% Read the audio signal
[x, Fs] = audioread('love_mono22.wav'); % Load the audio file
x = x(:, 1); % Ensure it’s a single channel (mono)

% Filter the audio signal
x_filtered = filter(filter_coeff, 1, x);

% Calculate and compare spectra
figure;
subplot(2, 1, 1);
pwelch(x, window, [],f, Fs); % Spectrum of the original signal
title('Spectrum of Original Signal');
subplot(2, 1, 2);
pwelch(x_filtered,window, [], f, Fs); % Spectrum of the filtered signal
title('Spectrum of Filtered Signal');

% Save the filtered signal as a .wav file
audiowrite('love_highpass_filtered.wav', x_filtered, Fs);

% Play the original and filtered signals (optional)
%sound(x, Fs); % Play the original signal
%pause(length(x)/Fs + 1); % Wait for the original signal to finish
%sound(x_filtered, Fs); % Play the filtered signal

% Comments on the difference
disp('Listen to the original and filtered signals to observe the attenuation of lower frequencies.');
