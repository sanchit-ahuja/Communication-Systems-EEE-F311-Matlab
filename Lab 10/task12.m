clear all;
P = 0.2;
Gr = 10;
Gt = 10;
lambda = 0.3370;
d = 100;
h = (Gr*Gt*(lambda)^2./(4*pi.*(d).^2)).^(0.5);
message = [1 0 1 0 1 0 0 1 1 1 1 1 1 1 0 1 0 0 0 0]; %My name encoded in ShannoFeno code
N = length(message);
for T=1:1:N+1
    fs = 200;
    ts = 1/fs;
    t = T-1/2:ts:(1/2+T);
    t1=-1/2:ts:1/2;
    const = [-1 1];
    if message(T) == 1
        m = 1;
    else
        m = -1;
    end
    raised_cosine_pulse = h*m*P*(cos(pi*1.*(t1)).*sinc(pi*1.*(t1)))./(1-4*(1).*((t1).^2));
    received_rc = raised_cosine_pulse + h*P*randn(1, length(raised_cosine_pulse));
    %m_t=r.*rectangularPulse(t);
    hold on;
    subplot(211);
    plot(t,raised_cosine_pulse);
     title('Transmitted Raised Cosine');
     xlabel('time')
     ylabel('Amplitude')
     grid on
     axis([-inf inf -0.01 0.01])
   hold on;
   subplot(212);
   plot(t,received_rc);
   title('Noisy Signal');
   xlabel('time')
   ylabel('Amplitude')
   grid on
   axis([-inf  inf -0.01 0.01])
   pause(0.5)
end