% clear;
% clc;
% close all;
%==================================
Orig_im = imread('cameraman.tif');
[A , B] = size(Orig_im);
fft_im2 = fftshift(fft2(double(Orig_im)));
H2 = zeros(A,B);
for u = 1:A
    for v = 1:B
        H2(u,v) = 2*(2.5-(cos(2*pi*(u-A/2)/A) + cos(2*pi*(v-B/2)/B)));
    end
end
 
filtered_im2 = fft_im2 .* H2;
new_im2 = real(ifft2(fftshift(filtered_im2)));
imshow(uint8(new_im2),[])
title('Image Enhancement using Laplacian in the frequency domain');
