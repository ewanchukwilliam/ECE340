
% Question 2 
figure;
k1 = 0:50;
x1 = 0.3 * (sinc(0.3*(k1-25)).*(0.54-0.46*cos(2*pi()*k1/50))); 
[x2,fs ]= audioread("baila.wav");
% sound(x3,fs);
k2 = [0: 1/fs :(length(x2)-1)/fs];
% subplot(2,1,1);
% stem(0:length(x2)-1, x2, 'r', 'DisplayName', 'Audio Signal baila.wav');
% title('Audio Signal x3[k]');
% xlabel('k');
% ylabel('Amplitude');
% legend show; 

% Plot x1[k] on the first subplot
subplot(1,1,1);
stem(0:50, x1, 'b', 'filled', 'DisplayName', 'x1[k]'); 
title('Discrete Time Signal x1[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Plot the real part of x2[k] on the second subplot
x3 = conv(x1,x2);
sound(x3,fs); 
audiowrite('baila_filtered.wav', x3,fs);