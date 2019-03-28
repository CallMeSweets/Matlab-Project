function [val] = ValOfFunction(q, z, a)
syms y(x) w(x) h(x);
y(x) = q;
w(x) = diff(y(x), 1);
h(x) = diff(y(x), 2);
    if(a == 0)
      val = double(y(z));  
    end
    
    if(a == 1)
      val = double(w(z));  
    end
    
    if(a == 2)
      val = double(h(z)); 
    end


end

