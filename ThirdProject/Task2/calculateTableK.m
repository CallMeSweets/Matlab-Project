function [tableK] = calculateTableK(y1,y2,h) 
    tableK = 0;
    tableK(1,1) = getValX1(y1,y2);
    tableK(1,2) = getValX2(y1,y2);
    tableK(2,1) = getValX1(y1+0.5*h*tableK(1,1), y2+0.5*h*tableK(1,2));
    tableK(2,2) = getValX2(y1+0.5*h*tableK(1,1), y2+0.5*h*tableK(1,2));
    tableK(3,1) = getValX1(y1+0.5*h*tableK(2,1), y2+0.5*h*tableK(2,2));
    tableK(3,2) = getValX2(y1+0.5*h*tableK(2,1), y2+0.5*h*tableK(2,2));
    tableK(4,1) = getValX1(y1+0.5*h*tableK(3,1), y2+0.5*h*tableK(3,2));
    tableK(4,2) = getValX2(y1+0.5*h*tableK(3,1), y2+0.5*h*tableK(3,2));
end

