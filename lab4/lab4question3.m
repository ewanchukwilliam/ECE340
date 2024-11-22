% Load the audio file
[x, Fs] = audioread('love_mono22.wav'); % Load the audio signal
N = 512;                                % FFT block size

% Estimate Power Spectral Density (PSD) using pwelch
[Px, F] = pwelch(x, N, [], N, Fs);

% Plot the PSD
figure;
plot(F/1000, 10*log10(Px)); % Frequency in kHz
xlabel('Frequency (kHz)');
ylabel('Power Spectral Density (in dB)');
title('Power Spectral Density of the Audio Signal');
grid on;

peak_power = max(10*log10(Px));          % Maximum power
threshold = peak_power - 20;            % Top 20 dB threshold
indices = find(10*log10(Px) >= threshold); % Indices within the range
freq_range = [F(indices(1)), F(indices(end))] / 1000; % Frequency kHz
disp(['Frequency range with most energy: ', num2str(freq_range(1)), ...
    ' kHz to ', num2str(freq_range(2)), ' kHz']);

[~, peak_indices] = findpeaks(10*log10(Px)); % Find peaks in the PSD
tonal_noise_frequency = F(peak_indices) / 1000; % Frequency in kHz
disp(['Tonal noise frequencies: ', num2str(tonal_noise_frequency')]);
