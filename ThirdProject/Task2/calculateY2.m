function [Y2] = calculateY2(tableK, y2, h)
Y2 = y2 + h * (tableK(1,2) + 2*tableK(2,2) + 2*tableK(3,2) + tableK(4,2)) / 6;
end

