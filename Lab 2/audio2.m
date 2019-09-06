function [x,mx,t,freqaxis] = audio2(filename,flag)
[x,Fs] = audioread(filename);
info = audioinfo(filename);
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
y = fft(x,512);
mx = abs(y);
freqaxis = Fs*(linspace(-0.5,0.5, length(y))); %Nyquist rate
if flag == 1
    figure(1);
    plot(t,x);
    title('Audio wave Signal');
    figure(2);
    plot(freqaxis,fftshift(mx));
    title('Freq plot');
end

