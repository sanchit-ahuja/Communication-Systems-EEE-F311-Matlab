clc;
clear all;
snr = 0.01:0.0001:100;
N = length(snr);
%plot(x,y_exact);
x = sqrt(2.*snr); %On off
erfc_x=erfc(x);
y_upper = exp(-(x).^2)/12 + (1/2*pi)^(0.5).*exp(-((x).^2)./2)./(x+1);
plot(10*log10(snr),y_upper,'r');
hold on;
plot(10*log10(snr),erfc_x,'g');
