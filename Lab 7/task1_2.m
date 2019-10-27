%Starting
Ts=0.00045;
n=linspace(-1,1,200);
sig=5*sin(2*pi*1000*n*Ts);
% figure
maxsig=max(sig); %signal max
interv=2*maxsig/(128); %interval length for 8 levels resolution mp
u=maxsig+interv; %size of codebook 1 more than partition
partition = -maxsig:interv:maxsig; 
codebook = -maxsig:interv:u;

% disp(codebook);
% disp(interv);
% disp(u);
disp((codebook));
% disp(size(codebook));
% disp((partition));
[index,quants] = quantiz(sig,partition,codebook); % Quantize.
% disp(quants);
encode = uencode(quants,8,5); %encode these values as 0 or 1
plot(n*Ts,encode);
% plot(n*Ts,sig,'-',n*Ts,quants,'-');
% legend('Original signal','Quantized signal');