function [x,mx,t,freqaxis] = sinfunc(f,flag)
fs = 6000; %sampling freq
t = 0:1/fs:0.08; %time vector of 1 s
%t = linspace(0,1,2*pi);
x = sin(2*pi*f*t);

%nfft = 1024; %length of fft
y = fft(x,512);
mx = abs(y);
freqaxis = fs*(linspace(-0.5,0.5, length(y))); %Nyquist rate
if flag == 1
    figure(1);
    plot(t,x);
    title('Sine Wave Signal');
    figure(2);
    plot(freqaxis,fftshift(mx));
    title('Freq plot');
end


