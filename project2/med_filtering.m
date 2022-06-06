clear;
clc;
close all;
%==================================
Orig_im = imread('eight.tif');
Noisy_im = imnoise(Orig_im,'salt & pepper',0.2);
imshow(Noisy_im)
size_of_im = size(Orig_im);
zero_padded_im = zeros(size_of_im+2);
zero_padded_im(2:end-1,2:end-1) = Noisy_im;
filtered_im = uint8(zeros(size_of_im));
for i = 1:size_of_im(1)
    for j = 1:size_of_im(2)
        
         win_size = zero_padded_im(i:i+2,j:j+2);
         sorted_win = sort(win_size(:));
         filtered_im(i,j) = sorted_win(5);
    
    end
end

imshow(filtered_im)
