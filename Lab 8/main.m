close all;
bits = [1 0 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 1 0 1 1 0 1 1 0 0 1 0];
[raised_cos,sincdata] = line_enc_rect(bits);
keyboard();
close all;
psd();
keyboard();
close all;
ask(bits);