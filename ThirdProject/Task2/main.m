
h = 0.005;
TableY1 = 0;
TableY2 = 0;
TableK = 0;
error1 = 0;
error2 = 0;
newTime = 0;
startTime = 0;
time(1) = 0;
TableY1(1) = 10;
TableY2(1) = 0;
endVal = 20/h;
factor = (863/60480) / ((-95/288) + (863 / 60480));

for i=1:1:endVal
   TableK = 0;
   TableK = calculateTableK(TableY1(i), TableY2(i), h);
   TableY1(i+1) = calculateY1(TableK, TableY1(i), h); 
   TableY2(i+1) = calculateY2(TableK, TableY2(i), h);
   error1(i) = factor * abs(TableY1(i+1) - TableY1(i));
   error2(i) = factor * abs(TableY2(i+1) - TableY2(i));
  
end




[t,y] = ode45(@vdp1, [0 20], [10; 0]);



%====  Plot Y1 and Y2 - Motion RK4 ====
% plot(TableY1,TableY2, '-b');
% hold on;
% plot(y(:,1),y(:,2), '-g');
% hold on;
% title(['Motion Runge-Kutta method h = ', num2str(h)]);
% xlabel('Y1'), ylabel('Y2');
% legend("X1", "X2");
% grid on

% ====  Plot Y1 and Y2 versus time RK4 ====
%  [n m] = size(TableY1); 
%  plot(0:20 / (m-1):20,TableY1, '-r');
%  hold on;
%  plot(0:20 / (m-1):20,TableY2, '-g');
%  xlabel('Time'), ylabel('Position');
%  title('RK4 method X1 & X2 versus time ');
%  grid on
%  legend("X1", "X2");

%====  Plot Y1 and Y2 RK4 variable ====
% [x1, x2] = RK4variable(10, 0, h, 10^-4, 10^-4);
% plot(x1, x2, 'r');
% title(['RK4 method with variable step size, h = ', num2str(h), ' ']);
% xlabel('X1'), ylabel('X2');
% grid on;





% ====  Plot Y1 errors versus time RK4 ====
% [n m] = size(error1);
% plot(0:20 / (m-1):20,error1, '-r'); 
% title('RK4 method X1 errors versus time h = 0.005');
% xlabel('Time'), ylabel('Error');
% grid on

% ====  Plot Y2 errors versus time RK4 ====
% [n m] = size(error2);
% plot(0:20 / (m-1):20,error2, '-r');
% title('RK4 method X2 errors versus time h = 0.005');
% xlabel('Time'), ylabel('Error');
% grid on

% ====  Plot step size versus time RK4 variable step size ====
% [x1, x2, err, steps] = RK4variable(10, 0, h, 10^-4, 10^-4);
% [n m] = size(steps);
% plot(0:20 / (m-1):20,steps, '-r'); 
% title('RK4 method with variable step size, steps versus time h = 0.005');
% xlabel('Time'), ylabel('Step');
% grid on

% ====  Plot Y1 errors versus time RK4 variable step size ====
%  [x1, x2, err, steps] = RK4variable(10, 0, h, 10^-4, 10^-4);
%  [n m] = size(err); 
%  plot(0:20 / (n-1):20,err(:,1), '-r'); 
%  title('RK4 method with variable step X1, errors versus time h = 0.005');
%  xlabel('Time'), ylabel('Error');
%  grid on;
 
 %====  Plot Y2 errors versus time RK4 variable step size ====
%  [x1, x2, err, steps] = RK4variable(10, 0, h, 10^-4, 10^-4);
%  [n m] = size(err); 
%  plot(0:20 / (n-1):20,err(:,2), '-r'); 
%  title('RK4 method with variable step X2, errors versus time h = 0.005');
%  xlabel('Time'), ylabel('Error');
%  grid on;


