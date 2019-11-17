clc;
clear all;
snr = 0.01:0.001:100;
N = length(snr);
% make a Q function
fun = @(x) exp(-(x.^2)/2);
% Q=(1/sqrt(2*pi))*integral(fun,snr,Inf);
BER_A = zeros(1,N);
BER_B = zeros(1,N);
for i=1:length(snr)
    A=sqrt(2*snr(i));
    B=sqrt(.5*snr(i));
    BER_A(1,i)= (1/sqrt(2*pi))*integral(fun,A,Inf);
    BER_B(1,i)= (1/sqrt(2*pi))*integral(fun,B,Inf);
end
hold on
plot(10*log10(snr),BER_A,'r');
plot(10*log10(snr),BER_B,'g');
hold off