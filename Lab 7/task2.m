u=255;
pm=0:1:10;
L=2^16;
sqnr=10*log10((3*L*L)/(log(1+u)^2));
line([0 10],[sqnr sqnr]);
legend('plot');