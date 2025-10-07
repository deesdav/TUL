clear; clc;

x=0:0.1:3;
y=x.^2-3*x+2;
plot(x, y);
z=0*x;
plot(x,[y;z]);
y=2*y;
plot(x,[y;z]);
