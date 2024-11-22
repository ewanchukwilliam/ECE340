% (a) Define the range of n for the first 10 samples
n = 0:10;

% Calculate the impulse response h1(n)
h1_n = n .* (0.5).^n .* sin(pi * n / 6); % u(n) is implied

% (b) Transfer function coefficients
numerator = [0 4, 0, -1]; % Coefficients for -z + 4z^3
denominator = [16, -16*sqrt(3), 20, -4*sqrt(3), 1]; % Coefficients for the denominator

% Calculate h2(n) using the filter function
impulse_input = [1, zeros(1, 10)];  % Impulse input
h2_n = filter(numerator, denominator, impulse_input);

% Plot h1(n) with circular markers
stem(n, h1_n, 'Marker', 'o', 'LineStyle', '-', 'Color', 'b', 'DisplayName', 'h_1(n)'); 

hold on; % Keep this plot for comparison

% Plot h2(n) with cross markers
stem(n, h2_n, 'Marker', 'x', 'LineStyle', '--', 'Color', 'r', 'DisplayName', 'h_2(n)'); 

title('Impulse Responses h_1(n) and h_2(n)');
xlabel('n');
ylabel('Amplitude');
grid on;
legend show; % Show the legend
hold off; % Release the plot hold