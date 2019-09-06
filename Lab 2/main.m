
%sinwave message
[a,b,c,d] = sinfunc(300,0);
[e,f,g,h] = sinfunc(600,0);
time = a + e;
timeaxis = c + g;
freq = b + f;
freqaxis = d + h;
figure(1);
plot(timeaxis,time);
figure(2);
plot(freqaxis,fftshift((freq)));

%recwave message
[i,j,k,l] = rec(0.6,2,0);
figure(3);
plot(j,i);
figure(4);
plot(l,fftshift(k));


