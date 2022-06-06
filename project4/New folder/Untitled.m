clear;
clc;
close all;
%==================================
orig_im = rgb2gray(imread('Screenshot (652).png'));
M1 = max(max(orig_im));
neg_i = M1 - orig_im;
article = rgb2gray(imread('Screenshot (655).png'));
M2 = max(max(article));
neg_a = M2 - article;
c1 = conv2(neg_a,neg_a);
% c2 = double(neg_a) .* double(neg_a);

similarity = conv2(neg_a,neg_i);

