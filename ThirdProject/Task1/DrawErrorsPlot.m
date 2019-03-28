function [outputArg1,outputArg2] = DrawErrorsPlot(rightVal, linearVal, QRVal, x, N)

plot(x,rightVal, 'go');
hold on;
plot(x,linearVal,'k+');
hold on;
plot(x,QRVal,'rx');
title(['Comparison experimental measurements with calculated N = ', num2str(N),' ']);
xlabel('X'), ylabel('Y');
grid on
end

