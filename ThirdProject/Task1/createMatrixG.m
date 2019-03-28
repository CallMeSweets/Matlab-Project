function [G, sol] = createMatrixG(N,x)
G = 0;
sol = 0;
    for j=1:1:N
        for i=1:1:N
        G(i,j) = getSum(i-1,j-1,11,x);
        end
    end
end

