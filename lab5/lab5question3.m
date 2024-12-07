% MATLAB Script for Bandstop FIR Filter Design (2.95 kHz to 3.05 kHz)

% Parameters
Fs = 22050; % Sampling frequency in Hz
fc_low = 2850; % Low cutoff frequency in Hz (2.95 kHz)
fc_high = 3150; % High cutoff frequency in Hz (3.05 kHz)
N = 512; % Filter order (number of taps), you can increase this for sharper response

% Normalized cutoff frequencies (scaled by Nyquist frequency)
wc_low = fc_low / (Fs / 2);
wc_high = fc_high / (Fs / 2);

% Truncation window function (Hamming)
window = hamming(N);

% Design the bandstop filter using fir1
filter_coeff = fir1(N-1, [wc_low wc_high], 'stop');

% Plot frequency response
figure;
freqz(filter_coeff, 1, 1024); % Frequency response
title('Frequency Response of Bandstop FIR Filter');

% Read the audio signal
[x, Fs] = audioread('love_mono22.wav'); % Load the audio file
x = x(:, 1); % Ensure it’s a single channel (mono)

% Filter the audio signal
x_filtered = filter(filter_coeff, 1, x);

% Calculate and compare spectra (in dB and kHz)
figure;
subplot(2, 1, 1);
pwelch(x, window, [], [], Fs); % Spectrum of the original signal
title('Spectrum of Original Signal');


subplot(2, 1, 2);
pwelch(x_filtered, window, [], [], Fs); % Spectrum of the filtered signal
title('Spectrum of Filtered Signal');


% Save the filtered signal as a .wav file
audiowrite('love_bandstop_filtered.wav', x_filtered, Fs);

% Play the original and filtered signals (optional)
%sound(x, Fs); % Play the original signal
%pause(length(x)/Fs + 1); % Wait for the original signal to finish
sound(x_filtered, Fs); % Play the filtered signal

% Comments on the difference
disp('Listen to the original and filtered signals to observe the bandstop behavior.');
