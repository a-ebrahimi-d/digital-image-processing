clear;
clc;
close all;
%==================================
Orig_im = imread('baby.jpg');
gray_im = rgb2gray(Orig_im);
Bi_im = de2bi(gray_im);
size_of_im = size(gray_im);


importfile('Tabriz_uni_logo.png')
Binary_logo = imbinarize(rgb2gray(cdata));
Bi_logo_resized = reshape(imresize(Binary_logo,size_of_im),[],1);

Bi_im(:,1) = Bi_logo_resized;

New_im = reshape(bi2de(Bi_im),size_of_im);

imshow(New_im)
