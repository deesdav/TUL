clc; clear; close all;

format long;
format compact;

Newton(0.1, @log, 1e-6, 100, 1e-8)
Newton(91, @sind, 1e-6, 100, 1e-8)
x=-4:0.01:4;
y=sin(x);
z=zderivuj(x,y);
plot(x,z);
hold on;
plot(x, cos(x));
y=x.^2;
z=zderivuj(x,y);
plot(x,z);
