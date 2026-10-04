clear; clc; close all;

x1 = -5:1:-1;
x2 = -1:1:1;
x3 = 2:1:5;

x = [x1 x2 x3];
y = [-1 * ones(size(x1)) x2 1 * ones(size(x3))];

figure;
plot(x, y);
grid on;
xlim([-5 5]);
ylim([-5 5]);

