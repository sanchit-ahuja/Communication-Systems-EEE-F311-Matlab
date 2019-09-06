clc;
close all;
fs=10000;
 k = 0:1/fs:0.1;
 x1 = 1*sin(2*pi*480*k);
 Ac=2;
 fc=1000;
 kf=1440;
 y=Ac*fmmod(x1,fc,fs,kf);
 figure(1);
 plot(k,y);
 
 y2 = fft(y,512);
mx = abs(y2);
freqaxis = fs*(linspace(-0.5,0.5, length(y2)));
figure(2);
plot(freqaxis,fftshift(mx));
figure(3);
plot(k,x1);