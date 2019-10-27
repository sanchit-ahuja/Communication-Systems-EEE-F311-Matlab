fs=200;
t=-0.5:1/fs:0.5;
m=sin(2*pi*10*t);
%subplot(2,1,1);
plot(t,m);
hold on;
stem(t,m);