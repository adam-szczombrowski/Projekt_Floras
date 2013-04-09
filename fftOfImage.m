function [] = fftOfImage(filename)

A = imread(filename);
I = rgb2gray(A);
D = I(14, 1 : end);
stem(abs(fft(D)))
hold on

end