function [val] = getValX2(x1,x2)
    val = -x1 + x2*(0.5 - x1*x1 - x2*x2);
end

