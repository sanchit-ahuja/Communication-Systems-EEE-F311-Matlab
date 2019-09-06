fs = 6200; %sampling freq %time vector of 1 s
%t = linspace(0,1,2*pi);
 k = 0:1/fs:0.5;
 x1 = sin(2*pi*480*k);
 x2 = sin(2*pi*620*k);
 aud=0.1*(x1+x2);
Y0 = zeros(1, Fs*0.5);% Silent Interval
Ys = [repmat([aud Y0], 1, 4) aud]; 
sound(Ys);
     