function y = Q_func(x)
    syms x;
Q = @(x) (1/2*pi)^(0.5).*exp((-x.^2)./2); 
end