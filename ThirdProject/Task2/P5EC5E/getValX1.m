function [val] = getValX1(x1,x2)
    val = x2 + x1*(0.5 - x1*x1 - x2*x2);
end

