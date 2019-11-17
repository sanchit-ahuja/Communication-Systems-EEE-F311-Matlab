clear all;
close all;
P = 1;
iter = 100;
err_vec = []
for x=1:1:iter
    const = [1/sqrt(2) + (1/sqrt(2))*1i, 1/sqrt(2) - (1/sqrt(2))*1i,-1/sqrt(2) + (1/sqrt(2))*1i, -1/sqrt(2) - (1/sqrt(2))*1i];
    m = const(randi(4));
    func_transmit = sqrt(P)*m;
    func_received = func_transmit + randn(1,1);
    err = abs(func_transmit-func_received);
    err_vec(x) = err;
    subplot(311);
    scatter(real(func_transmit),imag(func_transmit));
    title('Transmitted Symbols');
    xlabel('Real')
    ylabel('Imag')
    hold on
    subplot(312);
    scatter(real(func_received),imag(func_received));
    title('Received Symbols');
     xlabel('Real')
    ylabel('Imag')
    hold on
    pause(0.1)
end

symb = 1:1:iter;
subplot(313);
plot(symb,err_vec);
title('Error');
xlabel('Symbols');
ylabel('abserr');
    