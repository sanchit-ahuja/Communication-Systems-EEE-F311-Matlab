function [] = task2_1(randomize, sigma2)

    duration_signal = 30;
    count = 0;
    for T = 0:duration_signal

        fs = 500;
        ts = 1/fs;
        t = -T:ts:(1+T);
        B = 2;
        temp = rand();
        if(randomize == 1)
            if(temp >= 0.5)
                sigma2 = 2;
            else
                sigma2 = 0.01;
            end
        end
        v = sigma2*randn(1);

        if v < 0.5
            x = 1*sinc(2*pi*B*(t-T));
        else
            x = -1*sinc(2*pi*B*(t-T));
        end
        y = awgn(x, 1);

        hold all
        subplot(2,1,1);
        plot(t,x);
        xlabel('time');
        ylabel('amplitude');
        xlim([0 30]);

        hold on;
        subplot(2,1,2);
        plot(t,y);
        xlabel('time(t)');
        ylabel('Amplitude');
        xlim([0 30]);
        
        if v*max(y) < 0
            count = count + 1;
        end
    end
    if(randomize == 0)
        disp('Cnt of error pulses');
        disp(count);
        disp('Pulse error rate');
        disp( count/30);
    end
end