clear;
clc;
close all;
%==================================
new_background_im = imread('elgoli.jpg');
[A , B , C] = size(new_background_im);

object_im = imread('3.jpg');
[D , E , F] = size(object_im);

green_im = imread('green7.jpg');
mean_green_im = mean(green_im,[1 2]);

mean_object = (zeros(D,E,F));
mean_object(:,:,1) = 45;%mean_green_im(1);
mean_object(:,:,2) = 229;%mean_green_im(2);
mean_object(:,:,3) = 76;%mean_green_im(3);
pure_obj = double(object_im) - mean_object;
cube_dif = sum(abs(pure_obj),3);

new_im = zeros(D,E,F);
for i = 1:D
    for j = 1:E    
        if cube_dif(i,j) > 13^2
            
            new_background_im(i,j,:) = object_im(i,j,:);
            
        end
    end
end

imshow(new_background_im)