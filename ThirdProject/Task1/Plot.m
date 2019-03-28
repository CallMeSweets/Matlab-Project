y = [2.0081;-3.6689;-4.9164;-1.8700;-0.0454;0.5504;-0.8392;-1.0113;2.6133;14.6156;39.6554];
x = [-5;-4;-3;-2;-1;0;1;2;3;4;5];

N = 10;

G = createMatrixG(N,x);
sol = createMatrixSol(N,x,y);
sol = sol';

A = inv(G'*G)*(G'*sol);

[Q,R] = qr(G);
QRSol = transpose(Q)*sol;
B = linsolve(R, QRSol); 


ErrorsTableLinear = TableOfErrorsAproxmiation(N, x, y);
ErrorsTableQR = ErrorsAproximationsQR(N, x, y);
NormsTable = TableOfNorm(N,x,y);
k=1;
for q=-5:1:5
    TableOfLinearVal(k) = getAproximationErrors(q,N,A);
    TableOfQRVal(k) = getAproximationErrors(q,N,B);
    k=k+1;
end

% === Plot without QR
%DrawPlot(-5,5,N,A,x,y);

% === Plot with QR
%DrawPlot(-5,5,N,B,x,y);

% === Errors plot
%DrawErrorsPlot(y, TableOfLinearVal, TableOfQRVal,x, N);



