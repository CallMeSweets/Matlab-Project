function [Result] = NewtonMethod(z,x, ITER)
    res = zeros(1,ITER);
    
   
    
    for i=1:ITER
        x = x - (ValOfFunction(z,x,0) / ValOfFunction(z,x,1));
        res(i) = x;
    end
        
    Result = res';
    
end

