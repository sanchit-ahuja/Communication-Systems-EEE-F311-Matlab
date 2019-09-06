fs = 4400; %sampling freq
t = 0:1/fs:5; %time vector of 1 s
%t = linspace(0,1,2*pi);
x1 = sin(2*pi*350*t);
x2 = sin(2*pi*440*t);
dial = 0.09*(x1+x2);
sound(dial);