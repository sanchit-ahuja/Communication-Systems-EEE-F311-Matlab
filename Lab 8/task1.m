clear all;
close all;
duration_signal = 10;
rect=@(x) (sign(x+1)-sign(x-1))/2
for T=0:1:duration_signal
    fs = 200;
    ts = 1/fs;
    t = T-1/2:ts:(1/2+T);
    t1=-1/2:ts:1/2;
    N=length(t1);
    const = [-1 1];
    m = const(randi(2));
    m_t_1=m*sinc(2*pi*(t-T));
    m_t_2 = m*rect(t-T);
    m_t_3 =  m*(cos(pi*1.*(t-T)).*sinc(pi*1.*(t-T)))./(1-4*(1).*((t-T).^2));
    hold on;
    figure(1)
    subplot(311);
    plot(t,m_t_1);
     title('Transmitted Sinc');
     xlabel('time')
     ylabel('Amplitude')
     grid on
     axis([-inf inf -1 1])
     hold on;
    subplot(312);
    
    plot(t,m_t_2);
     title('Transmitted Rect');
     xlabel('time')
     ylabel('Amplitude')
     grid on
     axis([-inf inf -2 2])
     hold on;
     subplot(313);
     plot(t,m_t_3);
     title('Transmitted Raised Cosine');
     xlabel('time')
     ylabel('Amplitude')
     grid on
     axis([-inf inf -2 2])
   pause(0.5)
end

Fs = 200;
[Pxx,F] = periodogram(m_t_2,[],length(m_t_2),Fs);
figure(2)
subplot(311)
plot(F,log10(Pxx));

