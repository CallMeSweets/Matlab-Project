function [Table] = TableOfNorm(N,X,Y)
H = 0;

for i=1:1:N
    k = 1;
    matrix_G = 0;
    matrix_sol = 0;
    Q = 0;
    QRSol = 0;
    R = 0;
    matrix_G = createMatrixG(i,X);
    matrix_sol = createMatrixSol(i,X,Y);
    matrix_sol = matrix_sol';
    A = inv(matrix_G'*matrix_G)*(matrix_G'*matrix_sol);
    [Q,R] = qr(matrix_G);
    QRSol = transpose(Q)*matrix_sol;
    B = linsolve(R, QRSol);
    
    H(i,1) = (norm(matrix_sol - matrix_G*A))^2; 
    H(i,2) = (norm(matrix_sol - matrix_G*B))^2; 
end

Table = H;
end

