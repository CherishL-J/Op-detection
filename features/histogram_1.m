function [F] = histogram_1(img)

[m,n]=size(img);
H1=imhist(uint8(img));
H1=(H1/(m*n))*100;  

H1=fftshift(log10(abs(fft(H1))+1));
H1=(H1-min(H1))/(max(H1)-min(H1));  
H1=H1';

N=uint8(ones(1,16)*8);
s1=1;
for  i=1:16
    s2 = sum(N(1,1:i));
    F(1,i) = mean(H1(1,s1:s2));
    s1=s2+1;
end
end

