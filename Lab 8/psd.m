function [] = psd()
    Rb = 1; 
    Tb = 1/Rb;
    f = -2*Rb:0.05*Rb:2*Rb;
    x = f*Tb;

    PSINC = (1/Tb)*rectangularPulse(-Rb, Rb, f);
    PSINC = (1/Tb)*(abs(PSINC).*abs(PSINC));
    PRC = (cos(0.5*x).*cos(0.5*x).*rectangularPulse(-Rb, Rb, f));
    PRC = (1/Tb)*(abs(PRC).*abs(PRC));
    PRECT = (1/Tb)*abs(sinc(f)).*abs(sinc(f));
    subplot(311)
    plot(f,PSINC,'r');
    title('PSD: SINC');
    grid on;
    xlabel('Frequency');
    ylabel('PSD');
    subplot(312)
    plot(f,PRC,'g');
    title('PSD: Raised Cos');
    grid on;
    xlabel('Frequency');
    ylabel('PSD');
    subplot(313)
    plot(f, PRECT);
    title('PSD: Rect');
    grid on;
    xlabel('Frequency');
    ylabel('PSD');
    %title('PSD for Various Binary Line Codes');

end
