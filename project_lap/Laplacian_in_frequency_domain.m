% clear;
% clc;
% close all;
%==================================
Orig_im = imread('cameraman.tif');
[A , B] = size(Orig_im);
fft_im = fftshift(fft2(double(Orig_im)));
H = zeros(A,B);
for u = 1:A
    for v = 1:B
        H(u,v) = 1+((u - A/2-1)^2 + (v - B/2-1)^2)/2750;
    end
end
 
filtered_im = fft_im .* H;
new_im = real(ifft2(fftshift(filtered_im)));
imshow(uint8(new_im),[])
title('Image Enhancement using Laplacian in the frequency domain');
