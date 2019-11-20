function [exps] = line_enc_sinc(bits)
    if(length(bits) ~= 30)
        bits = [1 0 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 1 0 1 1 0 1 1 0 0 1 0];
    end
    bitrate = 1; % bits per second
    
    x = -30:0.01:30;
    ys = rectangularPulse(x);
    %yrc = (cos(pi*x).*sin(pi*x))/((pi*x)*(1-4*x.*x));
    exps = 0;
    for T=1:length(bits)
        if bits(T) == 1
            exps = exps + sinc(x - T);
        else
            exps = exps - sinc(x - T);
        end
        plot(x, exps);
        axis([0 inf -2.5 2.5])
        hold on;
        grid on;
        pause(1);
    end
    %plot(x,exps);
end