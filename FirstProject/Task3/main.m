
clear all; close all; clc


n=10;

Xa = generateMatrixA(n);
Ya = genSolMatrixA(n);   % generated matrix from task 2 a)

Xb = generateMatrixB(n);
Yb = genSolMatrixB(n);   % generated matrix from task 2 b)


Xq = basicMatrix();  %basic matrix in task 3
Yq = basicMatrixSol();

X = jacobieMethod(Xb, Yb);
Y = gaussSeidelMethod(Xq, Yq);

