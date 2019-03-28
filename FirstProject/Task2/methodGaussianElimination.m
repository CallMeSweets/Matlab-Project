%Functions using method of Gaussian Elimination for matrix A and vector B  
function [matrix] = methodGaussianElimination(A, B)
     
    %Create whole basic matrix XY: matrix A + vector B 
     XY = [A B]; 
    [~,n]=size(A); 
     nb=n+1;

    for k=1:n-1
        max = A(k,k);
        row = k;
        for i=k+1:n-1
            if(max < abs(A(i, k)))    %finding the row with maximal abs 
                max = abs(A(i,k));    %element at current column
                row = i;
            end
        end
        
        %Swaping rows if needed
        if(row ~= k)
           temp = A(k,:);
           A(k,:) = A(row,:);
           A(row,:) = temp;
        end
        
        %The elimination phase of Gaussian algorithm
        for i=k+1:n
            factor = XY(i,k)/ XY(k,k);
            XY(i,k:nb)=XY(i,k:nb)-factor*XY(k,k:nb);
        end
    end
    
    %Finding solutions starting from the end
    matrix=zeros(n,1); %solutions vector
    matrix(n)=XY(n,nb)/XY(n,n);
    for i=n-1:-1:1
        matrix(i)=(XY(i,nb)-XY(i,i+1:n)*matrix(i+1:n)) / XY(i,i);
    end
end