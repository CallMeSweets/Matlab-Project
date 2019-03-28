
%Machine epsilon script

machepsx = 1.0;
ITER = 0;

%Calculating the machine epsilon
while 1.0 + machepsx > 1.0
    machepsx = machepsx / 2;
    ITER = ITER + 1;
end

%Num of iteration
ITER = ITER-1;

%Epsilon times 2 to get value which we were looking for
machepsx = machepsx * 2;

disp(['ITER = ', num2str(ITER, 53)]);
disp(['Epsilon = ', num2str(machepsx, 53)]);

clear