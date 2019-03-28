close all
clear
clc
format long

syms y(x)
y(x) = 2*x^4 + 3*x^3 - 6*x^2 + 4*x + 7;

solutions1 = MullerM1(10, -6, -5, -4);
solutions2 = MullerM2(y(x), 10, -4);
solutions3 = LaguerreMethod(y(x),10,-4,4);
[Result] = NewtonMethod(y(x),-1.5, 10);

