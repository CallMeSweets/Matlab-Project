function [sol] = createMatrixSol(N,x,y)
sol = 0;
    for j=1:1:N
        sol(j) = getSol(j-1,11,x,y);
    end
end

