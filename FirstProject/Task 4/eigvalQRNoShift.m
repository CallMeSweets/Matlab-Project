
%method finding the solutions (eigenvalues) without shifts
function [eigval, iterCnt, finalA] = eigvalQRNoShift(A, N)
    iterCnt = 0;
    while max(max(A-diag(diag(A)))) > 10^-8
        
        [Q, R] = QRfactorization(A, N);
        A = R * Q;
        iterCnt = iterCnt + 1;
        
    end
    eigval = diag(A);
    finalA = A;
end

