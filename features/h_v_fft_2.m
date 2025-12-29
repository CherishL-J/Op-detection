function [M] = h_v_fft_2(im1,K,filename,imagename)
% Extraction of 1D amplitude spectrogram features from detail maps
im1=abs(im1);
im1=double(im1);
[m,n]=size(im1);
r=max(m,n);
c=floor(r/2)+1;  % Find the position of the DC component in the spectrogram
mm=c;            % Width of the selected spectrum (the first AC component cannot be ignored)
N=ones(1,K);
snum=sum(N);
ad=mm/snum;      % Evenly divided frequency subintervals

%     % Vertical FFT
%     im1_v = fftshift(log10(abs(fft(im1, r)) + 1), 2);
%     im_v = mean(im1_v, 1);
% 
%     % Horizontal FFT
%     im1_h = fftshift(log10(abs(fft(im1', r)) + 1), 2);
%     im_h = mean(im1_h, 1);
% Vertical
im1_v = zeros(m, r);
parfor i = 1:m
    fft_result = fft(im1(i,:), r);
    fft_abs_log = log10(abs(fft_result) + 1);
    im1_v(i,:) = fftshift(fft_abs_log);
end
im_v = mean(im1_v, 1);

% Horizontal
im1 = im1';
im1_h = zeros(n, r);
parfor i = 1:n
    fft_result = fft(im1(i,:), r);
    fft_abs_log = log10(abs(fft_result) + 1);
    im1_h(i,:) = fftshift(fft_abs_log);
end
im_h = mean(im1_h, 1);


C1=im_v(1,1:c);
C2=im_h(1,1:c);

C=(C1+C2)/2;
C=(C-mean(C))/ std(C); 


s1=1;
l=length(C);
len=length(N);
for i=1:len
    s2=floor(sum(N(1,1:i)*ad));
    if s2>l
        s2=l;
    end
    M1(1,i)=mean(C(1,s1:s2));
    s1=s2+1;
end
M=M1;
end


