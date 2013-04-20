function [] = fftOfImage(nameOfImage, labelOne, labelTwo)

imageA = imread(nameOfImage,'jpg');                 % wczytywanie obrazu

% Converting RGB image to binary image
imageA = rgb2gray(imageA);                          
levelA = graythresh(imageA);
imageA = im2bw(imageA, levelA);
imageA = ~imageA;                                   %robienie negatywu

% Showing images
figure, imshow(imageA)
title(labelOne)

% FFT algorithm
fftA = fft2(double(imageA));
fftA = fftshift(fftA);
fftA = abs(fftA);                                   %get the magnitude
fftB = log(fftA + 1);
fftA = mat2gray(fftB);
[m,n] = size(fftA);
fftA = fftA(1:m/2,n/2:n);                           %wybieranie 1 æwiartki
figure, imshow(fftA, []); % Display the result
title(labelTwo)

figure, stem(fftA(1,:))                             % fft jednego wiersza

end