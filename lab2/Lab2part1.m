

x1 =  0:4;
x2 = 0:3;
x2 = 2-x2;
% Plotting
figure;

% Plot x1[k] on the first subplot
subplot(3,1,1);
stem(0:4, x1, 'b', 'filled', 'DisplayName', 'x1[k]'); 
title('Discrete Time Signal x1[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Plot the real part of x2[k] on the second subplot
subplot(3,1,2);
stem(0:3,  x2, 'r', 'DisplayName', 'Real part of x2');
title('Real Part of x2[k]');
xlabel('k');
ylabel('Amplitude');
legend show;

% Plot the real part of x2[k] on the second subplot
x3 = conv(x1,x2);
subplot(3,1,3);
stem(0:7,  x3, 'r', 'DisplayName', 'Real part of x2');
title('convolution of x1 and x2');
xlabel('k');
ylabel('Amplitude');
legend show;

k1 = 0:50;
x4 = 0.3 * sinc(0.4*(k1-25))*(0.54-0.46*cos(2*pi*k1/50)); 

