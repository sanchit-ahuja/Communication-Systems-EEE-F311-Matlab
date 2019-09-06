function [snd]= task1_2(num1)
fs=16330;
v1=[1208,1336,1477,1633];
v2=[867,770,852,961];
t = 0:1/fs:0.25; %time vector of 1 s
%t = linspace(0,1,2*pi);
switch num1
    case 1
        x1 = sin(2*pi*v1(1)*t);
        x2 = sin(2*pi*v2(1)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 2
        x1 = sin(2*pi*v1(2)*t);
        x2 = sin(2*pi*v2(1)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 3
        x1 = sin(2*pi*v1(3)*t);
        x2 = sin(2*pi*v2(1)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 4
        x1 = sin(2*pi*v1(1)*t);
        x2 = sin(2*pi*v2(2)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 5
        x1 = sin(2*pi*v1(2)*t);
        x2 = sin(2*pi*v2(2)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 6
        x1 = sin(2*pi*v1(3)*t);
        x2 = sin(2*pi*v2(2)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 7
        x1 = sin(2*pi*v1(1)*t);
        x2 = sin(2*pi*v2(3)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 8
        x1 = sin(2*pi*v1(2)*t);
        x2 = sin(2*pi*v2(3)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    case 9
        x1 = sin(2*pi*v1(3)*t);
        x2 = sin(2*pi*v2(3)*t);
        aud= 0.1*(x1+x2);
        sound(aud);
    otherwise
    x1 = sin(2*pi*v1(2)*t);
    x2 = sin(2*pi*v2(4)*t);
    aud= 0.1*(x1+x2);
    sound(aud);
end






 
        


