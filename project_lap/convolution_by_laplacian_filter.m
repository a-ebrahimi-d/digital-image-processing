clear;
clc;
close all;
%==================================
Orig_im = imread('cameraman.tif');
h = fspecial('laplacian',0);
filtered_im = imfilter(double(Orig_im),h);
new_im_t = double(Orig_im) - filtered_im;
imshow(uint8(new_im_t))
title('convolved image by laplacian filtered')