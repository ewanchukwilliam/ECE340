% Read the original image
Img = imread('barbaraLarge.jpg');

% Display the original image
figure;
imshow(Img);
[rows, cols, channels] = size(img);
title('Original Image Size: ' + string(rows) + " rows x " + string(cols));

colorbar;

% Resize factors
resize_factors = [0.9, 0.7, 0.5];
% Preallocate for resized images
resized_images = cell(1, length(resize_factors));
dimensions = cell(1, length(resize_factors));

% Create a figure for resized images
figure;

% Loop through the resize factors
for i = 1:length(resize_factors)
    % Resize the image
    resized_images{i} = imresize(Img, resize_factors(i), 'nearest');
    dimensions{i} = size(resized_images{i}); % Get dimensions

    % Plot the resized image without anti-aliasing
    subplot(2, length(resize_factors), i);
    imshow(resized_images{i});
    title(['Without Anti-Aliasing Size: ' num2str(dimensions{i}(2)) ...
        'x' num2str(dimensions{i}(1))]);
    
    % Resize the image with anti-aliasing
    resized_images{i} = imresize(Img, resize_factors(i), 'nearest', ...
        'antialiasing', 1);
    dimensions{i} = size(resized_images{i}); % Get dimensions again

    % Plot the resized image with anti-aliasing
    subplot(2, length(resize_factors), i + length(resize_factors));
    imshow(resized_images{i});
    title(['With Anti-Aliasing Size: ' num2str(dimensions{i}(2)) 'x' ...
        num2str(dimensions{i}(1))]);
end

% Adjust layout
sgtitle('Resized Images Comparison');
