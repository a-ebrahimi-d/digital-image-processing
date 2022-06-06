clear;
clc;
close all;
%==================================
Orig_im = imread('cameraman.tif');
Bi_im = de2bi(Orig_im);
size_of_im = size(Orig_im);
figure
sgtitle('bitplane of original image')
for i=1:8
bitplane = (2^(7)) * reshape(bi2de(Bi_im(:,i)),size_of_im);
subplot(2,4,i);
imshow(bitplane)    
end

importfile('Tabriz_uni_logo.png')
Binary_logo = imbinarize(rgb2gray(cdata));
Bi_logo_resized = reshape(imresize(Binary_logo,size_of_im),[],1);

Bi_im_LSB = Bi_im;
Bi_im_LSB(:,1) = Bi_logo_resized;
New_im_LSB = reshape(bi2de(Bi_im_LSB),size_of_im);
figure
imshow(New_im_LSB)
title('New Image with modified LSB')

figure
sgtitle('bitplane of image Image with modified LSB')
for i=1:8
bitplane = (2^(7)) * reshape(bi2de(Bi_im_LSB(:,i)),size_of_im);
subplot(2,4,i);
imshow(bitplane)    
end

Bi_im_MSB = Bi_im;
Bi_im_MSB(:,8) = Bi_logo_resized;
New_im_MSB = reshape(bi2de(Bi_im_MSB),size_of_im);
figure
imshow(New_im_MSB)
title('New Image with modified MSB')

figure
sgtitle('bitplane of image Image with modified MSB')
for i=1:8
bitplane = (2^(7)) * reshape(bi2de(Bi_im_MSB(:,i)),size_of_im);
subplot(2,4,i);
imshow(bitplane)    
end
