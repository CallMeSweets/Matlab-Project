function matrix = generateSolMatrixA(n)
    Y=zeros(n,1);
    for i=1:1:n
       Y(i,1) = 0.9*i; 
    end
    matrix = Y;
end