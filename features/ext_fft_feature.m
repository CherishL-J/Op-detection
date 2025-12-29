function [M] = ext_fft_feature(img,K,filename,imagename)

img=double(img);
img = gpuArray(img);
% High-pass filter 1
 w=[-1,2,-1;2,-4,2;-1,2,-1];
 im1=imfilter(double(img), w, 'symmetric', 'same');
 im1=uint8(abs(im1));
 
% High-pass filter 2
 w=[-1 2 -2 2 -1;2 -4 4 -4 2; -2 4 -4 4 -2; 2 -4 4 -4 2; -1 2 -2 2 -1];
 im2=imfilter(double(img), w, 'symmetric', 'same');
 im2=uint8(abs(im2));
 
% High-pass filter 3
 w=[-1,3,-6,8,-6,3,-1];
 w=w'.*w; 
 w=-w;  
 im3=imfilter(double(img), w, 'symmetric', 'same');
 im3=uint8(abs(im3));
 
 M=[histogram_1(img), h_v_fft_2(im1,K), h_v_fft_2(im2,K), h_v_fft_2(im3,K)];

