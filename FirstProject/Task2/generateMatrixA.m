
%The function which generates matrix A
function matrix = generateMatrixA(n)
X=zeros(n,n);
    for i=1:1:n 
        for j=1:1:n
            if(i==j)
               X(i,j)=11; 
            end
            if(i==j-1)
               X(i,j)=5; 
            end
            if(i==j+1)
               X(i,j)=5; 
            end
        end
    end
    matrix = X;
end