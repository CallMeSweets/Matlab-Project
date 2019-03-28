function [z] = MullerM1(ITER, x0, x1, x2)
solutions = zeros(1,ITER);

    for i=1:ITER
        
        z0 = x0 - x2;
        z1 = x1 - x2;
        
        c = ValOfFun(x2);
        
        A = [z0^2 , z0; z1^2, z1];
        B = [ValOfFun(x0) - c; ValOfFun(x1) - c];
        [sol] = linsolve(A,B);
        
        a = sol(1,1);
        b = sol(2,1);
        
        den1 = b + sqrt(b^2 - 4*a*c);
        den2 = b - sqrt(b^2 - 4*a*c);
        
        if(abs(den1) >= abs(den2))
        zmin = -2*c / den1;
        else
        zmin = -2*c / den2;  
        end

        

        x3 = x2 + zmin;
        solutions(1, i) = x3;
        d0 = abs(x3-x0);
        d1 = abs(x3-x1);
        d2 = abs(x3-x2);
        
        
        
        if( d1 < d0 )
            u = x1;
            x1 = x0;
            x0 = u;
        end
        if( d2 < d1 )
            u = x2;
            x2 = x1;
            x1 = u;
        end
        x2 = x3;
    end
    
    z=solutions;
end

