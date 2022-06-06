clear;
clc;
close all;
%==================================
object_im = imread('yellow1.jpg');
r_im = mean(object_im(:,:,1),'all');
g_im = mean(object_im(:,:,2),'all');
b_im = mean(object_im(:,:,3),'all');

orig_im = imread('yellowlily.jpg');
gray_im = rgb2gray(orig_im);
[A , B , C] = size(orig_im);
for i=1:3
new_im(:,:,i) = gray_im;
end
mean_object = (zeros(A,B,C));
mean_object(:,:,1) = r_im;
mean_object(:,:,2) = g_im;
mean_object(:,:,3) = b_im;
mod_im = double(orig_im) - mean_object;
mod_im = mod_im.^2;
cube_dif = sum(abs(mod_im),3);
k=0;
for i = 1:A
    for j = 1:B    
        if cube_dif(i,j) < 120^2
            
            new_im(i,j,:) = orig_im(i,j,:);
            
        end
    end
end

imshow(new_im,[])
