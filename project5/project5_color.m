clear;
clc;
close all;
% =================================
%obtaining average rgb of an image with an specific color
object_im = imread('yellow.jpg');
mean_rgb_im = mean(object_im,[1 2]);
% =================================
% converting original image to a 3-D gray scale by replicating gray-scala
% level into all 3 layers
orig_im = imread('yellowlily.jpg');
gray_im = rgb2gray(orig_im);
[A , B , C] = size(orig_im);
new_im = uint8(zeros(A,B,C));
for i=1:3
new_im(:,:,i) = gray_im; 
end
% =================================
% transfering coordination of original image to center of desired color
mean_object = (zeros(A,B,C));
mean_object(:,:,1) = mean_rgb_im(1);
mean_object(:,:,2) = mean_rgb_im(2);
mean_object(:,:,3) = mean_rgb_im(3);
mod_im = double(orig_im) - mean_object;
% =================================
mod_im = mod_im.^2;
cube_dif = sum(abs(mod_im),3);

k=0;
for i = 1:A
    for j = 1:B    
        if cube_dif(i,j) < 80^2
            
            new_im(i,j,:) = orig_im(i,j,:);
            k = k+1;
        end
    end
end

imshow(new_im)
