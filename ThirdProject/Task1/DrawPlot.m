function [] = DrawPlot(begX, endX, N, matrixA, Q, W)
k = 1;
ifTrue = 1;
Y = 0;
sum = 0;
X = 0;
for i=begX:0.05:endX
    while ifTrue <= N
        if(ifTrue == 1)
           Y(k) = matrixA(ifTrue);
        else
           sum = matrixA(ifTrue);
           for j=1:1:ifTrue-1
              sum = sum * i; 
           end
        end
        Y(k) = Y(k) + sum;
        ifTrue = ifTrue + 1;
    end
    %Y(k) = Y(k) + sum;
    %Y(k) = matrixA(1) + matrixA(2) * i + matrixA(3)*i*i + matrixA(4)*i*i*i + matrixA(5)*i*i*i*i;
    X(k) = i;
    sum = 0;
    ifTrue = 1;
    k = k+1;
end
    
  plot(X,Y, '-g');
  hold on;
  plot(Q(:,1),W(:,1),'ro');
  title(['Least-squares approximation N = ', num2str(N), ' with QR']);
  xlabel('X'), ylabel('Y');
  grid on

end

