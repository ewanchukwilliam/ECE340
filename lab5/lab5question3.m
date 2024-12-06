% Load noisy audio signal
[noisy_signal, Fs] = audioread('love_mono22.wav');

% Plot the spectrum of the noisy signal
window_size = 1024; overlap = window_size / 2; nfft = 2048;
[p_noisy, f_noisy] = pwelch(noisy_signal, window_size, overlap, nfft, Fs);

figure;
plot(f_noisy / 1000, 10*log10(p_noisy), 'b', 'LineWidth', 1.5);
grid on; xlabel('Frequency (kHz)'); ylabel('Power/Frequency (dB/Hz)');
title('Spectrum of Noisy Audio Signal');

% Design lowpass filter (adjust cutoff frequency based on spectrum analysis)
fc = 5500; % Cutoff frequency in Hz
wc = fc / (Fs / 2); % Normalized cutoff frequency
N = 513; % Filter order
window = hamming(N);
filter_coeff = fir1(N-1, wc, 'low', window);

% Plot the filter response
figure;
freqz(filter_coeff, 1, 1024, Fs);
title('Frequency Response of the FIR Filter');

% Filter the noisy signal
filtered_signal = filter(filter_coeff, 1, noisy_signal);

% Compare the spectrum of the input and output signals
[p_filtered, f_filtered] = pwelch(filtered_signal, window_size, overlap, nfft, Fs);

figure;
subplot(2, 1, 1); % Noisy signal spectrum
plot(f_noisy / 1000, 10*log10(p_noisy), 'b', 'LineWidth', 1.5);
grid on; xlabel('Frequency (kHz)'); ylabel('Power/Frequency (dB/Hz)');
title('Spectrum of Noisy Signal');

subplot(2, 1, 2); % Filtered signal spectrum
plot(f_filtered / 1000, 10*log10(p_filtered), 'r', 'LineWidth', 1.5);
grid on; xlabel('Frequency (kHz)'); ylabel('Power/Frequency (dB/Hz)');
title('Spectrum of Filtered Signal');

% Save and play filtered audio
audiowrite('filtered_audio.wav', filtered_signal, Fs);

disp('Playing original noisy signal...');
sound(noisy_signal, Fs);
pause(length(noisy_signal) / Fs + 1);

disp('Playing filtered signal...');
sound(filtered_signal, Fs);

disp('Script completed! Listen to the difference between the noisy and filtered signals.');