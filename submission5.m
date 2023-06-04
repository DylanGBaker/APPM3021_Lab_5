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

[x,y] = RK4system(f,xspan,y0,N)

figure(1)
plot(x(:,1),y(:,2), '-d')
hold on
hold off

%% Question 2a
f = @(x,y) sin(x+y);
y0 = 0;
x0 = 0;
xf = pi;
N = 10;

[x1,y1] = Euler(f,x0,y0,N,xf)

N = 50;
[x2,y2] = Euler(f,x0,y0,N,xf)

N = 100;
[x3,y3] = Euler(f,x0,y0,N,xf)

figure(2)
plot(x1(:,1), y1(:,1), '-d')
hold on
plot(x2(:,1), y2(:,1), '-*')
plot(x3(:,1), y3(:,1), '-^')
hold off

%% Question 2b
f = @(x,y) sin(x+y);
y0 = 0;
x0 = 0;
xf = pi;
N = 300;

[x1,y1] = Euler(f,x0,y0,N,xf)
[x2,y2] = Heun(f,x0,y0,N,xf)
[x3,y3] = Midpoint(f,x0,y0,N,xf)
[x4,y4] = rk4(f,x0,y0,N,xf)

figure(3)
plot(x1(:,1), y1(:,1), '-d')
hold on
plot(x2(:,1), y2(:,1), '-*')
plot(x3(:,1), y3(:,1), '-^')
plot(x4(:,1), y4(:,1), '-o')
hold off


%% Question 3


%% Question 4a
f1 = @(x,y1,y2) y2;
f2 = @(x,y1,y2) 16.81 * y1;
f = {f1;f2};
y0 = [1.0 -4.1];
xspan = [0 2];
N = 30;

[x,y] = RK4system(f,xspan,y0,N)
figure(4)
plot(x(:,1),y(:,2))
%% Question 4b
f1 = @(x,y1,y2) y2;
f2 = @(x,y1,y2) 16.81 * y1;
f = {f1;f2};
y0 = [1.0 -4.101];
xspan = [0 2];
N = 30;

[x,y] = RK4system(f,xspan,y0,N)
figure(5)
plot(x(:,1),y(:,2))

%% Question 5

%% Question 6
y = @(x) exp((x^3)/3 - x);
f = @(x,y) y*x^2 - y;
x0 = 0;
h = 0.1;
xf = 2;
ytrue = getTruePointsForFunction(y,h,x0,xf);
errorMatrix = ivpmethods(f,x0,1,h,xf,ytrue)

figure(6)
subplot(1,3,1)
plot(errorMatrix(:,1),errorMatrix(:,2), '-o')
hold on
subplot(1,3,2)
plot(errorMatrix(:,1),errorMatrix(:,3), '-*')
subplot(1,3,3)
plot(errorMatrix(:,1),errorMatrix(:,4), '-^')
hold off

%% Question 7
end