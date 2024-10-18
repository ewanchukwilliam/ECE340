
% Question 2 
figure;
k1 = 0:50;
x1 = 0.3 * (sinc(0.3*(k1-25)).*(0.54-0.46*cos(2*pi()*k1/50))); 
[x2,fs ]= audioread("baila.wav");
% sound(x3,fs);
k2 = [0: 1/fs :(length(x2)-1)/fs];
subplot(3,1,1);
stem(0:length(x2)-1, x2, 'r', 'DisplayName', 'Audio Signal baila.wav');
title('Audio Signal x3[k]');
xlabel('k');
ylabel('Amplitude');
legend show; 

% Plot x1[k] on the first subplot
subplot(3,1,2);
stem(0:50, x1, 'b', 'filled', 'DisplayName', 'x1[k]'); 
title('Discrete Time Signal x1[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Plot the real part of x2[k] on the second subplot
x3 = conv(x1,x2);
subplot(3,1,3);
stem(0:length(x3)-1,  x3, 'r', 'DisplayName', 'Real part of x2');
title('convolution of both signals');
xlabel('k');
ylabel('Amplitude'); 
sound(x3,fs);