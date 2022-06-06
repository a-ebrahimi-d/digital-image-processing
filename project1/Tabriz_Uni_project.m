clear;
clc;
close all;
%==================================
Orig_im = imread('cameraman.tif');
Bi_im = de2bi(Orig_im);
size_of_im = size(Orig_im);

importfile('Tabriz_uni_logo.png')
Binary_logo = imbinarize(rgb2gray(cdata));
Bi_logo_resized = reshape(imresize(Binary_logo,size_of_im),[],1);

Bi_im(:,8) = Bi_logo_resized;

New_im = reshape(bi2de(Bi_im),size_of_im);

imshow(New_im)
