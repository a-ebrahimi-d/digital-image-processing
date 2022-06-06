clear;
clc;
close all;
%==================================
Orig_im = imread('cameraman.tif');
fft_im = fftshift(fft2(Orig_im));

D0 = 10;
H = zeros(size(fft_im));
for i = 0:D0
    for j = 0:D0
        if i^2 + j^2 <= D0^2
            H(129-i,129-j) = 1;
            H(129-i,129+j) = 1;
            H(129+i,129-j) = 1;
            H(129+i,129+j) = 1;
        end
    end
end

filtered_im = fft_im .* H;
new_im = real(ifft2(fftshift(filtered_im)));

imshow(uint8(new_im),[])
title('ILPF D0 = 10')

fft_new_im = fftshift(log(1+abs(fft2(new_im))));
figure
imshow(fft_new_im,[])
title('Fourier transform of filtered image with ILPF D0=10')
