clc;    % Clear the command window.  
workspace;  % Make sure the workspace panel is showing.
format longg;
format compact;

rgbImage = imread('2.png');
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows columns numberOfColorBands] = size(rgbImage);
% Display the original color image.
subplot(2, 3, 1);
imshow(rgbImage, []);
title('Original Color Image');
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Get the rows and columns to split at,
% Taking care to handle odd-size dimensions:
col1 = 1;
col2 = floor(columns/2);
col3 = col2 + 1;
row1 = 1;
row2 = floor(rows/2);
row3 = row2 + 1;
% Now crop
upperLeft = imcrop(rgbImage, [col1 row1 col2 row2]);
upperRight = imcrop(rgbImage, [col3 row1 columns - col2 row2]);
lowerLeft = imcrop(rgbImage, [col1 row3 col2 row2]);
lowerRight = imcrop(rgbImage, [col3 row3 columns - col2 rows - row2]);
% Display the images.
subplot(2, 3, 2);
imshow(upperLeft);
subplot(2, 3, 3);
imshow(upperRight);
subplot(2, 3, 5);
imshow(lowerLeft);
subplot(2, 3, 6);
imshow(lowerRight);