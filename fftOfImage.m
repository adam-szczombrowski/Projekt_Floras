function [] = fftOfImage()

% A = imread('StampLack.jpg');
% I = rgb2gray(A);
% D = I(14, 1 : end);
% F = fft(D);
% stem(abs(fftshift(D)))
% % stem(abs(fft(D)))


imageA = imread('Stamp','jpg');
imageB = imread('StampLack','jpg');

figure, imshow(imageA)
title('Obraz ze wszystkimi zabkami')

figure, imshow(imageB)
title('Obraz bez niektorych zabkow')

fftA = fft2(double(imageA));
fftB = fft2(double(imageB));


fftA = fftshift(fftA); % Center FFT
fftB = fftshift(fftB);

fftA = abs(fftA); % Get the magnitude
fftB = abs(fftB);

fftA = log(fftA + 1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
fftB = log(fftB + 1);

fftA = mat2gray(fftA); % Use mat2gray to scale the image between 0 and 1
fftB = mat2gray(fftB);

figure, imshow(fftA, []); % Display the result
title('FFT dla obrazu ze wszystkimi zabkami')

figure, imshow(fftB, []);
title('FFT dla obrazu bez niektorych zabkow')

end