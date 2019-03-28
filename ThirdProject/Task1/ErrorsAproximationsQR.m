function [Table] = ErrorsAproximationsQR(N, X, Y)
for i=1:1:N
    k = 1;
    matrix_G = 0;
    matrix_sol = 0;
    Q = 0;
    R = 0;
    matrix_G = createMatrixG(i,X);
    matrix_sol = createMatrixSol(i,X,Y);
    matrix_sol = matrix_sol';
    [Q R] = qr(matrix_G);
    QRSol = transpose(Q)*matrix_sol;
    A = linsolve(R, QRSol);
    for x=-5:1:5
        TableOfErrors(i,k) = getAproximationErrors(x,i,A) - Y(k);
        k=k+1;
    end
end

Table = TableOfErrors;
end

