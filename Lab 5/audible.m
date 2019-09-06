fs = 4800; %sampling freq %time vector of 1 s
%t = linspace(0,1,2*pi);
 k = 0:1/fs:2;
 x1 = sin(2*pi*480*k);
 x2 = sin(2*pi*440*k);
 aud=0.19*(x1+x2);
Y0 = zeros(1, Fs*4);% Silent Interval
Ys = [repmat([aud Y0], 1, 4) aud]; 
sound(Ys);
        