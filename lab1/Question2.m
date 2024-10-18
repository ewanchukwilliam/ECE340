
% Question 2 
figure;
[x3,fs ]= audioread("baila.wav");
% sound(x3,fs);
x3len = length(x3)
k3 = [0: 1/fs :(size(x3)-1)/fs];

stem(k3, x3, 'r', 'DisplayName', 'Audio Signal baila.wav');
title('Audio Signal x3[k]');
xlabel('k');
ylabel('Amplitude');
legend show;
x3s =x3(1:size(x3)/2);
x3Energy = sum(abs(x3).^2)
audiowrite('baila_half.wav', x3s,fs/2);
% sound(x3,fs)
% sound(x3s,fs)
% question  2 finish