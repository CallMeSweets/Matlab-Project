function [Y1] = calculateY1(tableK, y1, h)
Y1 = y1 + h * (tableK(1,1) + 2*tableK(2,1) + 2*tableK(3,1) + tableK(4,1)) / 6;
end

