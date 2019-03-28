function DrawPlot()

x = -4: 0.2: 3;


plot(x, 2*x.*x.*x.*x + 3*x.*x.*x - 6*x.*x + 4*x + 7, 'r-');
title('Plot of the polynomial: f(x) = 2x^4 + 3x^3 - 6x^2 + 4x + 7');

xL = xlim;
line(xL, [0 0],'color','g','linewidth',0.3)
xlabel('x'), ylabel('f(x)')
hold on;

end

