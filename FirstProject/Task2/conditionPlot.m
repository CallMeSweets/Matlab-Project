x = 1:8;
n = 10;
conds = zeros(1, 8);

for i = 1:6
    
    A = generateMatrixB(n); 
    conds(i) = cond(A);
    
    x(i) = n;
    n = n * 2;
    
end

plot(x, conds, 'r-');
xlabel('n'), ylabel('Condition number');
grid on
title('Function describing the relation of condition number and number of equations');