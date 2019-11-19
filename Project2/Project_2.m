clear all
close all
rb=4;  %%%%modify according to your question
count=0;
message = [1 0 1 0 0 1 0 0 0 1 0 0 0 0 1 ]; %Adding an extra zero for padding
duration_signal = length(message);
noise_power = 0;
power = 0;
hest = 0;
H = 2.11675577960809e-06 + 1.55537649022810e-06i;
for T = 1:1/rb:duration_signal -2  %%%% Duration 30 seconds with interval of 1 sec.
    fs=200;
    ts=1/fs;
    t = T-rb/2:ts:(rb/2+T);
    t1=-rb/2:ts:rb/2;
    N=length(t1);
    B=1;
    %%%%you need to haveHuffman code for your name: modify
    const=(1/sqrt(2))*[1+1j, -1-1j, -1+1j, 1-1j];
    if message(floor(T):floor(T+1)) == [0 0]
        m = const(1);
    elseif message(floor(T):floor(T+1)) == [0 1]
            m = const(2);
    elseif message (floor(T):floor(T+1)) == [1 0]
        m = const(3);
    else
        m = const(4);
    end
        P=0.15;
    X= sqrt(P)*m;
       pt_sinc= real(X).*sinc(rb*t1*2*10)+ imag(X).*sinc(rb*t1*2*10); %%basis signal%modify if needed
          
   
    
    channel_gain = sqrt(10^-12) *randn(1);
    
    rec=channel_gain* pt_sinc;
    noise_p= 10^(-14);
    recieved = rec.*pt_sinc + sqrt(noise_p).*randn(1,length(pt_sinc)); 
    %%%MF apply Single point
    y=sqrt(P)*channel_gain*m+sqrt(noise_p).*randn(1);
    hest=hest+y;
    figure(100)
    hold all
    subplot(2,1,2), scatter (real(y), imag(y))
    hold all
    subplot(2,1,1), scatter (real(m), imag(m))  
    figure(1)
    hold on
    subplot(2,1,1), plot(t,pt_sinc);
    hold on
     title('transmitted pulse');
    xlabel('time')
    ylabel('Amplitude')
    subplot(2,1,2), plot(t,recieved);
    grid on
    axis([-inf  inf -inf inf])
    title('received pulse');
    xlabel('time')
    ylabel('Amplitude')
    grid on
    axis([-inf  inf -inf inf])
    %figure
    %plot(t, recieved);
    if P == 0 
        noise_power = noise_power + abs(y)*abs(y);
    else
        power = power + abs(y)*abs(y);
    end
    single = abs(y)*abs(y);
    pause(0.01)  %%%%% pauses for 2 seconds and then go for next loop increment.
    
    est = y/(sqrt(P)*H);
    distances = zeros(4,1);
    for co = 1:4
        distances(co) = abs(est-const(co));
    end
    [~,minIndex] = min(distances);
    if(minIndex == 1)
        decoded(floor(T)) = "00";
    elseif (minIndex == 2)
        decoded(floor(T)) = "01";
    elseif (minIndex == 3)
        decoded(floor(T)) = "10";
    else
        decoded(floor(T)) = "11";
    end
    figure(50);
    hold on;
    scatter(real(const(minIndex)), imag(const(minIndex)));
end
%disp(power);

noise_power = 5.5216e-13;
SNR = power/noise_power;
C = round(log2(1+SNR));

H = sqrt(SNR * noise_p);
hest = hest/(sqrt(P)*X);
%H = sqrt(P)*10^-6;

disp(decoded);
