n = 10;

format long;

%Generates matrix and vector
A = generateMatrixB(n); 
b = genSolMatrixB(n);

%Solves matrix A using Gaussian Elimination method
x = methodGaussianElimination(A,b);

results = x;

%Matrix with norms
residuums = vecnorm(A * x - b);

%Calculates 20 norm of vectors
for i = 1:21
    
    r = A * x - b;
    dx = methodGaussianElimination(A, r);
    x = x - dx;
    
    results = [results x];
    if i ~= 1
        residuums = [residuums vecnorm(r)];
    end
end

plot(0:20, residuums, 'r-');
xlabel('Iteration'), ylabel('||r||2');
grid on;
title('Function describing the relation of the second norm of residuum vector and iteration');