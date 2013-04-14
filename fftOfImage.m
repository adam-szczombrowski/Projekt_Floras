function [] = fftOfImage(nameOfImage, labelOne, labelTwo)

imageA = imread(nameOfImage,'jpg');

% Converting RGB image to binary image
imageA = rgb2gray(imageA);
levelA = graythresh(imageA);
imageA = im2bw(imageA, levelA);

% Showing images
figure, imshow(imageA)
title(labelOne)

% FFT algorithm
fftA = fft2(double(imageA));
fftA = fftshift(fftA);
fftA = abs(fftA);
fftA = log(fftA + 1);
fftA = mat2gray(fftA);
figure, imshow(fftA, []); % Display the result
title(labelTwo)

end