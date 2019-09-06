function [x,t,mx,freqaxis] = rec(w,A,flag)
fs = 150;
t = -1:1/fs:1;
x = A*rectpuls(t,w);
y = fft(x,512);
mx = abs(y);
freqaxis = fs*(linspace(-0.5,0.5, length(y))); %Nyquist rate
if flag == 1
    figure(1);
    plot(t,x);
    title('rec Wave Signal');
    figure(2);
    plot(freqaxis,fftshift(mx));
    title('Freq plot');
end
