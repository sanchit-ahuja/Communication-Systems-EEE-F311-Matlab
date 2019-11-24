function [exps_raised_cos,exps_sinc] = line_enc_rect(bits)
    if(length(bits) ~= 30)
        bits = [1 0 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 1 0 1 1 0 1 1 0 0 1 0];
    end
    bitrate = 1; % bits per second
    
    x = -30:0.01:30;
    R = 0.5; %Rolloff factor
    yrc = @(x)(sin(pi*x).*cos(pi*R*x))./((pi*x).*(1 - (4*x.*x.*R.*R)));
    exps_rect = 0;
    exps_sinc = 0;
    exps_raised_cos = 0;
    for T=1:length(bits)
        hold all;
        if bits(T) == 1
            exps_rect = exps_rect + rectangularPulse(x - T);
            exps_sinc = exps_sinc + sinc(x - T);
            exps_raised_cos = exps_raised_cos + yrc(x - T);
        else
            exps_rect = exps_rect - rectangularPulse(x - T);
            exps_sinc = exps_sinc - sinc(x - T);
            exps_raised_cos = exps_raised_cos - yrc(x - T);
        end
        subplot(311);
        plot(x, exps_rect);
        title('Rect Pulse')
        axis([0 inf -2 2])
        hold on;
        grid on;
        subplot(312);
        plot(x, exps_sinc);
        title('Sinc Pulse')
        axis([0 inf -2 2])
        hold on;
        grid on;
        subplot(313);
        plot(x, exps_raised_cos);
        title('Raised cos')
        axis([0 inf -2 2])
        hold on;
        grid on;
        pause(0.25);
    end
    %plot(x,exps);
end