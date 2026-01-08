clc; close all; clear;

format long;
format compact;

x = 0:1;
y = x;
Integral(x,y);

x = -1:0.0001:1;
y = sqrt(1-x.^2);
2*Integral(x,y);
axis equal;
plot(x,y);

x = 0:0.1:2*pi;
y = cos(x);
z = zintegruj(x,y, 0);
plot(x,z);
hold on;
plot(x, sin(x));

y=sin(x);
z = zintegruj(x,y,0);
plot(x,z);
hold on;
plot(x, -cos(x)+1);

z = zintegruj(x,y,-1);
plot(x,z);
hold on;
plot(x,-cos(x));

Y=zderivuj(x, z);
plot(x, Y);
hold on;
plot(x,y);
x=1:0.01:10;
y=log(x);
z = zderivuj(x,y);
plot(x,z);
hold on;
plot(x,1./x);
Y= 1./x;
Z = zintegruj(x,Y,0);
plot(x,Z);
hold on;
plot(x, log(x));