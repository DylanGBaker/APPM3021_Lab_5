function submission5
format long
%% Question 1
f1 = @(x,y1,y2,y3) y2;
f2 = @(x,y1,y2,y3) y3;
f3 = @(x,y1,y2,y3) -(y1-(1/4))*y3 + (1/4);

f = {f1;f2;f3};
y0 = [0 0 2];
xspan = [0 10];
N = 20;

[x,y] = RK4system(f,xspan,y0,N);

figure(1)
plot(x(:,1),y(:,2), '-d')
xlabel("x")
ylabel("y'")
hold on
hold off

%% Question 2a
f = @(x,y) sin(x+y);
y0 = 0;
x0 = 0;
xf = pi;
N = 10;

[x1,y1] = Euler(f,x0,y0,N,xf);

N = 50;
[x2,y2] = Euler(f,x0,y0,N,xf);

N = 100;
[x3,y3] = Euler(f,x0,y0,N,xf); 

figure(2)
plot(x1(:,1), y1(:,1), '-d')
hold on
plot(x2(:,1), y2(:,1), '-*')
plot(x3(:,1), y3(:,1), '-^')
legend("x and y for N = 10", "x and y for N = 50", "x and y for N = 100", 'Location','best')
xlabel("x")
ylabel("y")
hold off

%% Question 2b
f = @(x,y) sin(x+y);
y0 = 0;
x0 = 0;
xf = pi;
N = 300;

[x1,y1] = Euler(f,x0,y0,N,xf);
[x2,y2] = Heun(f,x0,y0,N,xf);
[x3,y3] = Midpoint(f,x0,y0,N,xf);
[x4,y4] = rk4(f,x0,y0,N,xf);

figure(3)
plot(x1(:,1), y1(:,1), '-d')
hold on
plot(x2(:,1), y2(:,1), '-*')
plot(x3(:,1), y3(:,1), '-^')
plot(x4(:,1), y4(:,1), '-o')
legend("Euler", "Heun", "Midpoint", 'rk4', 'Location','best')
xlabel("x")
ylabel("y")
hold off

disp("When zooming in on the graph in Matlab the Euler method is seperated from the other graphs showing that the other methods are better.")

%% Question 3
E = 9;
L = 1.2 * 10^-3;
C = 5 * 10^-3;
R = 0.25;
N = 20;
xspan = [0 0.05];
y0 = [0 0 0 0];
f1 = @(x,y1,y2,y3,y4) y2;
f2 = @(x,y1,y2,y3,y4) (E/L) - (R/L)*y2 - (1/L*C)*y2 - (1/L*C)*y4;

f = {f1; f2};

[x1,y1] = RK4system(f,xspan, y0, N);

f1 = @(x,y1,y2,y3,y4) y2;
f2 = @(x,y1,y2,y3,y4) -(R/L)*y2 - (2/L*C)*y1 + (1/L*C)*y4;

f = {f1;f2};
[x2,y2] = RK4system(f,xspan, y0, N);
figure(4)
plot(x1(:,1),y1(:,2), '-*')
hold on
plot(x2(:,1),y2(:,2), '-^')
legend('i1', 'i2', 'Location','best')
xlabel("time")
ylabel("current")
hold off

%% Question 4a
f1 = @(x,y1,y2) y2;
f2 = @(x,y1,y2) 16.81 * y1;
f = {f1;f2};
y0 = [1.0 -4.1];
xspan = [0 2];
N = 30;

[x,y] = RK4system(f,xspan,y0,N);
figure(5)
plot(x(:,1),y(:,1))
xlabel("x")
ylabel("y")
%% Question 4b
f1 = @(x,y1,y2) y2;
f2 = @(x,y1,y2) 16.81 * y1;
f = {f1;f2};
y0 = [1.0 -4.101];
xspan = [0 2];
N = 30;

[x,y] = RK4system(f,xspan,y0,N);
figure(6)
plot(x(:,1),y(:,2))
xlabel("x")
ylabel("y")

disp("When determining the analytical solution I used D operators. This gave y = Ae^(4.1*x) + Be^(-4.1*x). Using the initial conditions in 4a, A = 0 and B = 1. So when solving using the analytical method");
disp("The A term is not there for 4a. Hence only the Be^(-4.1*x) contributes.");
disp("When using initial conditions from 4b, A = 0.034 and B = 0.966. Now that A is there, the Ae^(4.1*x) contributes to solution and causes it to be different from the solutions of y for initial conditions 4a");

%% Question 5
y = @(x) exp((x^3/3)- x);
f = @(x,y) y*x^2 - y;
x0 = 0;
h = 0.1;
xf = 2;
ytrue = getTruePointsForFunction(y,h,x0,xf)
errorMatrix = ivpmethods(f,x0,1,h,xf,ytrue);

figure(7)
subplot(1,3,1)
plot(errorMatrix(:,1),errorMatrix(:,2), '-o')
xlabel("x")
ylabel("y error")
legend("Euler", 'Location','best');
hold on
subplot(1,3,2)
plot(errorMatrix(:,1),errorMatrix(:,3), '-*')
legend("Heun", 'Location','best');
xlabel("x")
ylabel("y error")
subplot(1,3,3)
plot(errorMatrix(:,1),errorMatrix(:,4), '-^')
legend("rk4", 'Location','best');
xlabel("x")
ylabel("y error")
hold off

%% Question 5
%% Question 7
end