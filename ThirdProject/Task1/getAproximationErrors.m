function [Val] = getAproximationErrors(i, N, matrixA)
ifTrue = 1;
Y = 0;
sum = 0;
     while ifTrue <= N
        if(ifTrue == 1)
           Y = matrixA(ifTrue);
        else
           sum = matrixA(ifTrue);
           for j=1:1:ifTrue-1
              sum = sum * i; 
           end
        end
        Y = Y + sum;
        ifTrue = ifTrue + 1;
    end
    Val = Y;
end

