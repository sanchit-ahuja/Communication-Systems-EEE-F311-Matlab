fs=200;
t=-0.5:1/fs:0.5;
m=sin(2*pi*10*t);
l=length(m);
disp(l);
delta=0.05;
b=zeros(1,l); %Signal to be made
mq=zeros(1,l); %change in the values quantized signal
for i=1:l-1
    if m(1,i)>=mq(1,i)
        b(1,i)=1;
        mq(1,i+1)=mq(1,i)+delta;
    else
        b(1,i)=0;
        mq(1,i+1)=mq(1,i)-delta;
    end
end
plot(t,m);
hold on;
stairs(t,mq);
sum =0;
for i =1:l-1
    sum = sum + (m(1,i)-mq(1,i)).^2;
end
disp(sum);
