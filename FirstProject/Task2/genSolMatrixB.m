
%The function which generates vector b of matrix B
function matrix = genSolMatrixB(n)
    Y=zeros(n,1);
    for i=1:1:n
        if(rem(i,2) == 0)
            Y(i,1) = 2/(3*i);    
        end
        if(rem(i,2) ~= 0)
            Y(i,1) = 0;
        end
    end
    matrix = Y;
end