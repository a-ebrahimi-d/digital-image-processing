clear;
clc;
close all;
%==================================
orig_im = rgb2gray(imread('text.png'));
M1 = max(max(orig_im));
N_I = M1 - orig_im;
article = rgb2gray(imread('article_S.png'));
M2 = max(max(article));
N_a = M2 - article;

[A , B] = size(orig_im);
[C , D] = size(article);
P = A + C -1;
Q = B + D -1;

fft_N_I = fft2(N_I,P,Q);
fft_N_a = fft2(N_a,P,Q);

Product_I_a = (fft_N_I) .* conj(fft_N_a);
Filtered_I = ifft2(Product_I_a);
product_a = fft_N_a .* conj(fft_N_a);
corr_a = ifft2(product_a);
similarity = max(max(corr_a));

LOCATION = find(Filtered_I>similarity*0.90);
N_L = numel(LOCATION);
col = floor(LOCATION/P);
raw = LOCATION - col * P;
mask = ones(C,D);
MASK = zeros(A,B);
Number_of_found_articles = 0;
for i = 1:N_L
    if MASK(raw(i) , col(i)) == 0
        MASK(raw(i):raw(i)+C-1 , col(i):col(i)+D-1) = mask;
        Number_of_found_articles = Number_of_found_articles+1;
    end
end

export = orig_im .* uint8(MASK);
Number_of_found_articles
imshow(Filtered_I,[])
figure
imshow(export)

