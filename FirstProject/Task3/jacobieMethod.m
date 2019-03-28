%Jacobi method algorithm
function [matrix] = jacobieMethod(A,B)
    
n=length(A);
r = 1:2;
q = 1:2;

x=zeros(n,1);
%Decompose matrix A
D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);

ITER = 1;


tolerance = 10^-10;

%checks dominance
if ~(checkColDominance(A, n) || checkRowDominance(A, n))
    
    %checks radius
    radius = max(abs(eig(-inv(D)*(L+U))));  
    if radius >= 1
        matrix = radius;
        return;
    end
end

    %main algorithm checks the tolerance, saves number of iterations
    while vecnorm(A*x-B)>tolerance
        x = -inv(D) * (L+U) * x + inv(D)*B;
        r(ITER) = vecnorm(A * x - B);
        q(ITER) = ITER;
        ITER = ITER + 1;
    end
   
    ITER = ITER - 1;
    disp(['After ' num2str(ITER) ' iterations... ']);
    
    %draws plot
    plot(q,r, 'g-');
    title('Second norm of the solutions versus number of iterations');
    xlabel('Iterations'), ylabel('||Ax - b||');
    grid on
    
    matrix=x;
   
end