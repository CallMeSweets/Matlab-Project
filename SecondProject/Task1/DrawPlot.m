function DrawPlot()

x = 2: 0.2: 12;

%plot(x, (0.3*x.*sin(x) - log(x+1)), 'r-');
plot(x, (0.3*sin(x) + 0.3*x.*cos(x) - (1./(x+1))), 'r-');
title('Derivative of the function: f(x) = 0.3*x.*sin(x) - log(x+1)');
%title('Basic function: f(x) = 0.3*x.*sin(x) - log(x+1)');
xL = xlim;
line(xL, [0 0],'color','g','linewidth',0.3)
xlabel('x'), ylabel('f`(x)')
hold on;

end

