% Question 1: Load and Inspect the Audio File

% Load the audio file
[x, fs] = audioread('love_mono22.wav');

% Display the matrix size (number of samples) and sampling rate (fs)
disp('Size of the audio signal (samples x channels):');
disp(size(x));

disp('Sampling rate (Hz):');
disp(fs);

% Calculate the duration of the audio signal
duration = length(x) / fs; % Duration in seconds
disp('Duration of the audio signal (seconds):');
disp(duration);

% Assuming 8 bits per sample (as specified in the question)
bit_depth = 8; 

% Calculate the bit-rate (in bits per second)
bit_rate = bit_depth * fs * length(x);
disp('Bit rate (bits/sec):');
disp(bit_rate);
sound(x,fs)