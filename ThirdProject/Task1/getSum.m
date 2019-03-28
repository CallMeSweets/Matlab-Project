function [sum] = getSum(i,k,size, matrix)

sum = 0;
for j=1:1:size
    sum = sum + matrix(j)^(i+k);
end

end

