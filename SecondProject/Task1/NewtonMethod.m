function [Result,iterations] = NewtonMethod(a, b, ep)


    if ValOfFunction(a)*ValOfFunction(b)>0
        error("Wrong interval");
    end
   
    iterations = 1;
    Result = zeros(10,2);
    
    Result(iterations, 1) = a - ValOfFunction(a) / DervValOfFunction(a);
    Result(iterations, 2) = ValOfFunction(Result(iterations,1));
    a = Result(iterations, 1);
    
    while abs(Result(iterations,2)) > ep
        iterations = iterations + 1;
        
        Result(iterations, 1) = a - ValOfFunction(a) / DervValOfFunction(a);
        Result(iterations, 2) = ValOfFunction(Result(iterations,1));
        a = Result(iterations, 1);
        
    end
        
    Result = Result(1:iterations,1);
    
end

