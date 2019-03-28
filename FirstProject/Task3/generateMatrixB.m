function matrix = generateMatrixB(n)
X=zeros(n,n);
for i=1:1:n 
    for j=1:1:n
        X(i,j) = 7/(8*(i+j+1));
      
    end
    matrix = X;
end