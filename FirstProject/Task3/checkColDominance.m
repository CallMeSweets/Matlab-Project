
%Checking columns dominance
function [retv] = checkColDominance(A, N)

    for i = 1:N
        sum = 0.0;
        for j = 1:N
            if i == j
                continue;
            end
            
            sum = sum + abs(A(j, i));    
        end
        
        if abs(A(i, i)) <= sum
            retv = false;
            return;
        end
    end    
    
    retv = true;
end