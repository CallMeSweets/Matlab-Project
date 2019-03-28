function [z] = ValOfFun(q)
syms y(x)
y(x) = 2*x^4 + 3*x^3 - 6*x^2 + 4*x + 7;
z = double(y(q));
end

