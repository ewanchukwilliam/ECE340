function y=sysresp(x, a)

% computes the output in response to an arbitrary input x[n], n=0,N-1
% assume that the system has 0 initial conditions
% input:
% x: the input signal,
% a: the system parameter
% output:
% y: the output signal
N = length(x); % length of the vector
% initialization of the output signal

% question 4 start
y = zeros(1,N);

for i = 2:N;
    y(i) = x(i) + y(i-1) * a;
end

figure;

stem(0:N-1, y, 'b', 'filled', 'DisplayName', 'x1[k]'); 
title('Discrete Time Signal y[k], a=-0.5');
xlabel('k');
ylabel('Amplitude');
legend show;
hold on;
% the first element in y is y[0], the second is y[1], ...
% note that in Matlab, the vector index starts from 1 and must be a pos. integer
% so the output at time n (y[n]) is the (n+1)th element in the vector y
% we are interested in the output for 0<=n<=N-1
% assume that y[n]=0 for n<0, first calculate y[0]

% finding the output y[1] to y[N-1]


return

