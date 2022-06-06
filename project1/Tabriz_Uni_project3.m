clear;
clc;
close all;
%==================================
Orig_im = imread('baby.jpg');
Bi_im = de2bi(Orig_im);
size_of_im = size(Orig_im);


importfile('Tabriz_uni_logo.png')
Binary_logo = imbinarize((cdata));
Bi_logo_resized = reshape(imresize(Binary_logo,size_of_im(1),size_of_im(2)),[],1);

Bi_im(:,1) = Bi_logo_resized;

New_im = reshape(bi2de(Bi_im),size_of_im);

imshow(New_im)
