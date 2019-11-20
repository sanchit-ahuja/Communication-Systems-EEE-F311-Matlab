function [] = ask(bits)
    if(length(bits) ~= 30)
        bits = [1 0 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 1 0 1 1 0 1 1 0 0 1 0];
    end
    bitrate = 1; % bits per second 
    x = 0:0.01:30;
    tb = 1;
    for T = 1:length(bits)
        hold all;
        if bits(T)==1
            y = cos(1000*(x-T)).*rectangularPulse(x-0.5-T);
        else
            y = 0;
        end
        plot(x, y);
        title('Ask Pulse')
        xlabel('Time')
        ylabel('Amplitude')
        axis([0 inf -2 2])
        hold on;
        grid on;
        pause(0.2);
    end
end

