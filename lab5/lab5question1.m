% Parameters for filter design
Fs = 22050;                  % Sampling frequency in Hz
fc = 2500;                   % Cut-off frequency in Hz
wc = fc / (Fs / 2);          % Normalized cut-off frequency
N = 513;                     % Filter order (number of taps = N)
window = hamming(N);         % Hamming window
filter_coeff = fir1(N-1, wc, 'low', window); % Low-pass FIR filter design

% Plot the frequency response of the filter
figure;
freqz(filter_coeff, 1, 1024, Fs);  % Frequency response
title('Frequency Response of the FIR Filter');

% Read the audio signal
[x, Fs_audio] = audioread('love_mono22.wav'); % Load audio signal
if Fs_audio ~= Fs
    error('Sampling frequency mismatch: Expected %d Hz, but got %d Hz', Fs, Fs_audio);
end

% Filter the audio signal
x_filtered = filter(filter_coeff, 1, x); % Filter the audio signal

% Compare the spectrum of the input and output signals
window_size = 1024; 
overlap = window_size / 2;
nfft = 2048;

% PSD of input signal
[p_input, f_input] = pwelch(x, window_size, overlap, nfft, Fs);

% PSD of filtered signal
[p_output, f_output] = pwelch(x_filtered, window_size, overlap, nfft, Fs);

% Plot comparison in two subplots
figure;
subplot(2, 1, 1); % First subplot for input signal spectrum
plot(f_input, 10*log10(p_input), 'b', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Spectrum of Input Signal');

subplot(2, 1, 2); % Second subplot for filtered signal spectrum
plot(f_output, 10*log10(p_output), 'r', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Spectrum of Filtered Signal');

% Save the modified output signal
audiowrite('filtered_love_mono22.wav', x_filtered, Fs); % Save output

% Play both signals
disp('Playing original signal...');
sound(x, Fs);  % Play original signal
pause(length(x) / Fs + 1); % Wait for playback to complete

disp('Playing filtered signal...');
sound(x_filtered, Fs); % Play filtered signal

disp('Script completed! Listen to the difference between the original and filtered signals.');