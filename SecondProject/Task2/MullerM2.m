function [z] = MullerM2(z, ITER, x)
solutions = zeros(1,ITER);
    for i = 1:ITER
       c = ValOfFunction(z, x, 0);
       b = ValOfFunction(z, x, 1);
       a = ValOfFunction(z, x, 2) / 2;
       
       zPlus = -2*c /(b + sqrt(b*b - 2*c*2*a)); 
       zMinus = -2*c /(b - sqrt(b*b - 2*c*2*a)); 
       
        if(abs(zPlus) > abs(zMinus))
        x = x + zMinus;
        else
           x = x + zPlus;     
        end
        solutions(1, i) = x;
    end
   z = solutions;
end

