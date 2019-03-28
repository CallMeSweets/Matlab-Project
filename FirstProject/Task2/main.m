
n = 1:2;
r = 1:2;

basic_n = 10;

%Loop to find the maximal n - number of equations
for i = 1:8

    A = generateMatrixA(basic_n); %B instead of A for changing of matrix
    b = genSolMatrixA(basic_n); %B instead of A for changing of matrix

    x = methodGaussianElimination(A,b);
    
    %Norm of the vector
    r(i) = norm(A * x - b, 2);
    %Number of iterations
    n(i) = basic_n;
    basic_n = basic_n * 2 ;
    
end


%Drawing the plot
plot(n,r, 'r-');
title('Function describing the releation of the solution error versus number of equations');
xlabel('n'), ylabel('Error r(n)')
grid on

