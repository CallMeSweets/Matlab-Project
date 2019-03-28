function [x1values, x2values, errors, steps] = RK4variable(x1, x2, h, epsRel, epsAbs)
% x1 - value of x1
% x2 - value of x2
% h - step
% epsRel - relative epsilon
% epsAbs - absolute epsilon
i = 1;
a = 0;

x1values(1) = x1;
x2values(1) = x2;
steps(i) = h;

while (a < 20)
    %calculate whole step
    tableK = calculateTableK(x1, x2, h);
    
    tempx1 = x1;
    tempx2 = x2;
    
    x1 = calculateY1(tableK, x1, h);
    x2 = calculateY2(tableK, x2, h);
    
    x1values(i + 1) = x1;
    x2values(i + 1) = x2;
    
    %caltulate first half step
    h = 0.5 * h;
    
    tableK = calculateTableK(x1, x2, h);
     
    tmp1 = calculateY1(tableK, x1, h);
    tmp2 = calculateY2(tableK, x2, h);
    
    %caltulate second half step
    tableK = calculateTableK(tmp1, tmp2, h);
    
    tmp1 = calculateY1(tableK, tmp1, h);
    tmp2 = calculateY2(tableK, tmp2, h);
    
    h = 2 * h;
    
    errors(i, 1) = (tmp1 - x1) / 15;
    errors(i, 2) = (tmp2 - x2) / 15;
    
    eps1 = abs(tmp1) * epsRel + epsAbs;
    eps2 = abs(tmp2) * epsRel + epsAbs;
    
    err1 = (eps1 / abs(errors(i, 1)))^(1/5);
    err2 = (eps2 / abs(errors(i, 2)))^(1/5);
    
    err = min(err1, err2);
    
    hnew = 0.9 * err * h;
    
    if (0.9 * err >= 1)
        if (a + h >= 20)
            break;
        else
            a = a + h;
            h = min([hnew, 5 * h, 20 - a]);
            i = i + 1;
            steps(i) = h;
            continue;
        end
    else
        if (hnew < 0)
            error('Cant solve with this epsilon');
        else
            h = hnew;
        end
    end
   
    i = i + 1;
    steps(i) = h;
end