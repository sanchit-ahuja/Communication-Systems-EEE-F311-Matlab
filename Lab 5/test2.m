clear all
close all
duration_signal=1;
Ac=2;
fc=1000;
kf=1440;
for T = 0:0.1:duration_signal  %%%% Duration 30 seconds with interval of 1 sec.
    if T==0
    display('Transmission Started')
     display (T)
    elseif (T==duration_signal) 
        display('Transmission ends: see the final result')
     display (T)
    else
            display('Transmission in progress: please wait')
     display (T)
    end 
   
    f=5;
    fs=10*fc;
    ts=1/fs;
    t = T:ts:(0.1+T);
    x1 = 1*sin(2*pi*480*t);
    m_t=Ac*fmmod(x1,fc,fs,kf);  %%% randi(5) takes random values between 1 to 5.
     N=length(m_t) ; 
    m_f=fft(m_t)/N;
    
    freqaxis=(linspace(-fs/2,fs/2, N));
   
    figure(1)
    
    hold all  %%% keeps the previous plots and everytime changes the color
    subplot(2,1,1), plot(t,m_t);
    xlabel('time')
    ylabel('amplitude')
    grid on
    axis([0  inf -5 5])   %%% first two are limits for x-axis, the other two are limits for y-axis: observe why 0 inf , and -5 5 are used here.
    hold on     %%% keeps the previous plots 
    subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)))
      xlabel('frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf 0 3])  %%% first two are limits for x-axis, the other two are limits for y-axis: observe why -inf inf , and 0 3 are used here. 
    
      
    pause(2)  %%%%% pauses for 2 seconds and then go for next loop increment.
end
