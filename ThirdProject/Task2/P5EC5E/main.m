beta = [1901/720, -2774/720, 2616/720, -1274/720, 251/720];
betaI = [475/1440, 1427/1440, -798/1440, 482/1440, -173/1440, 27/1440];

x1 = 10;
x2 = 0;

TableY1 = 0;
TableY2 = 0;
TableK = 0;
errorP1 = 0;
errorP2 = 0;
time(1) = 0;
errorFactor = (863/60480) / ((-95/288) + (863 / 60480));
TableY1(1) = 10;
TableY2(1) = 0;
h = 0.005;

t = 0:h:20;

for i=1:1:4
  
   TableK = 0;
   TableK = calculateTableK(TableY1(i), TableY2(i), h);
   TableY1(i+1) = calculateY1(TableK, TableY1(i), h); 
   TableY2(i+1) = calculateY2(TableK, TableY2(i), h);
    
end

for i=6:length(t)
  sum1 = 0;
  sum2 = 0;
    for j=1:5
       sum1 = sum1 + beta(j)*getValX1(TableY1(i-j), TableY2(i-j)); 
       sum2 = sum2 + beta(j)*getValX2(TableY1(i-j), TableY2(i-j));
    end
     
    tmp1 = TableY1(i-1) + h*sum1; 
    tmp2 = TableY2(i-1) + h*sum2;
    sum1 = 0;
    sum2 = 0;
    
    for j=1:5
       sum1 = sum1 + betaI(j+1)*getValX1(TableY1(i-j), TableY2(i-j)); 
       sum2 = sum2 + betaI(j+1)*getValX2(TableY1(i-j), TableY2(i-j)); 
    end
    
    
    TableY1(i) = TableY1(i-1) + h*sum1 + h*betaI(1)*getValX1(tmp1, tmp2);
    TableY2(i) = TableY2(i-1) + h*sum2 + h*betaI(1)*getValX2(tmp1, tmp2);
    errorP1(i) = errorFactor*abs(tmp1 - TableY1(i));
    errorP2(i) = errorFactor*abs(tmp2 - TableY2(i));
end
 
[t,y] = ode45(@vdp1, [0 20], [10; 0]);


%====  Plot Y1 and Y2 - Motion PECE ====
% plot(TableY1,TableY2, '-g');
% hold on;
% plot(y(:,1),y(:,2), '-r');
% hold on;
% title(['Motion Runge-Kutta method h = ', num2str(h)]);
% xlabel('Y1'), ylabel('Y2');
% legend("X1", "X2");
% grid on


% ====  Plot Y1 and Y2 - Motion PECE versus time====
% [n m] = size(TableY1);  
%  plot(0:20 / (m-1):20,TableY1, '-r');
%  hold on;
%  plot(0:20 / (m-1):20,TableY2, '-g');
%  xlabel('Time'), ylabel('Position');
%  title('PECE method X1 & X2 versus time ');
%  grid on
%  legend("X1", "X2");

% ====  Plot Y1 errors versus time PECE ====
% [n m] = size(errorP1);
% time = 0:20 / (m-1):20;
% plot(0:20 / (m-1):20,errorP1, '-r'); 
% hold on;
% title('PECE method X1 errors versus time h = 0.005');
% xlabel('Time'), ylabel('Error');
% grid on

% ====  Plot Y2 errors versus time PECE ====

% [n m] = size(errorP2);
% plot(0:20 / (m-1):20,errorP2, '-r');
% hold on;
% title('PECE method X2 errors versus time h = 0.005');
% xlabel('Time'), ylabel('Error');
% grid on;







