function [z] = LaguerreMethod(z, ITER, x, n)
solutions = zeros(1,ITER+1);
solutions(1) = x;
    for i = 1:ITER
       c = ValOfFunction(z, solutions(i), 0);
       b = ValOfFunction(z, solutions(i), 1);
       a = ValOfFunction(z, solutions(i), 2) / 2;
       
        if(abs(b + sqrt( (n-1)*((n-1)*(b^2) - n*a*c*2))) > abs(b - sqrt( (n-1)*((n-1)*(b^2) - n*a*c*2) )))
           den = b + sqrt( (n-1)*((n-1)*(b^2) - n*a*c*2));
        else
           den = b - sqrt( (n-1)*((n-1)*(b^2) - n*a*c*2));
        end
           solutions(i+1) = solutions(i) - (n*c)/ den;
          
       
    end

z = solutions;
end

