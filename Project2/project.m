clear all
close all
rb=4;  %%%%modify according to your question
count=0;
message = [1 0 0 0 0 1 1 0 1 1 1 0 1 1 1 1 1 0 1 0 1 0];
ans = [];
power = 0; 
H = 2.11675577960809e-06 + 1.55537649022810e-06i;
%Adding an extra zero for padding
duration_signal = length(message);
for T = 1:1/rb:duration_signal - 2  %%%% Duration 30 seconds with interval of 1 sec.
    fs=200;
    count = count + 1;
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
    X= sqrt(P)*m; %Transmitting a single constellation
       pt_sinc= real(X).*sinc(rb*t1*2*B)+ imag(X).*sinc(rb*t1*2*B); %%basis signal%modify if needed
       channel_gain = sqrt(10^-12) *randn(1); %Fixing the channel gain
    rec=channel_gain* pt_sinc;
    noise_p= 10^(-14);
    recieved = rec.*pt_sinc + sqrt(noise_p).*randn(1,length(pt_sinc)); 
    %%%MF apply Single point
    y = sqrt(P)*channel_gain*m+sqrt(noise_p).*randn(1);
    y = y/(sqrt(P)*H);
    temp_vec = [abs(y-const(1)),abs(y-const(2)),abs(y-const(3)),abs(y-const(4))];
    pt = find(temp_vec==min(temp_vec));
    ans(floor(T)) = pt;
    power = power + abs(y)*abs(y);
    
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
    pause(0.01)  %%%%% pauses for 2 seconds and then go for next loop increment.
end
disp(ans);