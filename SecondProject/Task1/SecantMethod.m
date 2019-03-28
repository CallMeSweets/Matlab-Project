function [Result,iterations] = SecantMethod(a, b, ep)


    if ValOfFunction(a)*ValOfFunction(b)>0
        error("Wrong interval");
    end
   
    iterations = 1;
    Result = zeros(10,2);
   
    c = b - ((ValOfFunction(b)*(b-a))/(ValOfFunction(b) - ValOfFunction(a)));
    a = b;
    b = c;

    if abs(ValOfFunction(a)) < abs(ValOfFunction(b))
       Result(iterations, 1) = a; 
    else
       Result(iterations, 1) = b; 
    end
    Result(iterations, 2) = ValOfFunction(Result(iterations,1));
    
    while abs(Result(iterations,2)) > ep
        iterations = iterations + 1;
        c = b - ((ValOfFunction(b)*(b-a))/(ValOfFunction(b) - ValOfFunction(a)));
        a = b;
        b = c;
        
        if abs(ValOfFunction(a)) < abs(ValOfFunction(b))
           Result(iterations, 1) = a; 
        else
           Result(iterations, 1) = b; 
        end
        Result(iterations, 2) = ValOfFunction(Result(iterations,1));
    end
        
    Result = Result(1:iterations,1);
    
end

