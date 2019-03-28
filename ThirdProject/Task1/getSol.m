function [sum] = getSol(k,size, matrixX, matrixY)

sum = 0;
for j=1:1:size
    sum = sum + matrixY(j)*(matrixX(j)^k);
end

end

