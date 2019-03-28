function [Table] = TableOfErrorsAproxmiation(N, X, Y)
TableOfErrors = 0;

for i=1:1:N
    k = 1;
    matrix_G = 0;
    matrix_sol = 0;
    matrix_G = createMatrixG(i,X);
    matrix_sol = createMatrixSol(i,X,Y);
    matrix_sol = matrix_sol';
    A = inv(matrix_G'*matrix_G)*(matrix_G'*matrix_sol);
    for x=-5:1:5
        TableOfErrors(i,k) = getAproximationErrors(x,i,A) - Y(k);
        k=k+1;
    end
end

Table = TableOfErrors;

end

