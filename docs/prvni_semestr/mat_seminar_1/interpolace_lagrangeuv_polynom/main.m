clc; clear; close all;

% do konzole

format compact;
x = [1; 2]; 
y = [1; 2];
V = [x, x.^0];
a = V \ y;
xx = 0:0.1:3;
yy = polynom(xx, a);
plot(xx, yy);
hold on;
plot(x, y, 'ro');

x = [-1; 0; 1];
y = [-1; 0; 1];
V = [x.^2, x, x.^0];
a = V \ y;
xx = -2:0.1:2;
yy = polynom(xx, a);
plot(xx, yy);
hold on;
plot(x, y, 'ro');

x = [-3; -2; -1; 0; 1; 2; 3];
y = [1; 0; 1; 0; 1; -1; 0];
a = interpol(x, y);
xx = -4:0.1:4;
yy = polynom(xx, a);
plot(xx, yy);
hold on;
plot(x, y, 'ro');

x = [-1; 0; 1; 2; 4];
y = [-1; 0; 1; 2; 3];
a = regrese(x, y, 1);
xx = 0:0.1:5;
yy = polynom(xx, a);
plot(xx, yy);
plot(x, y, 'ro');