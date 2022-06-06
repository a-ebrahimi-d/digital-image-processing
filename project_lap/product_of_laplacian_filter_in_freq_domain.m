clear;
clc;
close all;
%==================================
Orig_im = imread('cameraman.tif');
h = fspecial('laplacian',0);
[A , B] = size(Orig_im);
[C , D] = size(h);
P = A + C -1;
Q = B + D -1;
fft_im = fftshift(fft2(double(Orig_im),P,Q));
H = fftshift(fft2(h,P,Q));
filtered_im = fft_im .* H;
edge_im_resize = real(ifft2(fftshift(filtered_im)));
edge_im = edge_im_resize(1+(C-1)/2:A+((C-1)/2),1+(D-1)/2:B+((D-1)/2));
new_im_f =  double(Orig_im) - edge_im;
imshow(uint8(new_im_f),[])
title('product of Fourier transform of filter and Image');
