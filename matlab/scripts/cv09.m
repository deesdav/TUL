clc; clear all; close all

% 1

f1 = @(x) sin(x)./x + exp(-(x-4).^2);
x = -10:0.1:10;
y = f1(x);

figure;
plot(x, y, 'b')
hold on;

[xmin1, fmin1] = fminbnd(f1, 2, 4);
[xmin2, fmin2] = fminbnd(f1, 4, 6);

plot(xmin1, fmin1, 'rX', 'MarkerSize', 20);
plot(xmin2, fmin2, 'rX', 'MarkerSize', 20);
hold off;

% 2

f2 = @(xr) 1./4 .* xr.^4 - 41./6 .* xr.^3 +209./4 .* xr.^2 - 135 .* xr;
xr = -20:0.1:20;
yr = f2(xr);

figure;
plot(xr, yr, 'b');
hold on;

[xmin3, fmin3] = fminbnd(f2, -20, 20);
plot(xmin3, fmin3, 'rX', 'MarkerSize', 20);
hold off;
% 3

f3 = @(x1, x2) 100 .* (x2 - x1.^2).^2 + (1 - x1).^2;
x1 = -2:0.1:2;
x2 = -2:0.1:2;
[X1, X2] = meshgrid(x1, x2);

Z = f3(X1, X2);

figure;
surf(X1, X2, Z);
hold on;

f_wrp = @(x) f3(x(1), x(2));
[x_min, f_min] = fminsearch(f_wrp, [1; 1]);

plot3(x_min(1), x_min(2), f_min, 'rX', 'MarkerSize', 20);

% 4
f4 = [-5, -2, -6];

A = [
    1, -1, 1;
    3, 2, 4;
    3, 2, 0;
];
b = [
    20; 42; 30;
];
lb = [0; 0; 0];

f4xmin = linprog(f4, A, b, [], [], lb, []);

% 5

H = [ 8   2   0
      2   4  -3
      0  -3   6 ];
f = [
    -1; 0; 0;
];
A = [
    1, -1, 1;
    1, 2, -6;
];
b = [
    -1; 5;
];
lb = [
    0; 0; 0;
];

f5xming = quadprog(H, f, A, b, [], [], lb, [], []);

syms x1 x2 x3;
f5 = 4 * x1^2 + 2 * x2^2 + 3 * x3^2 + 2 * x1 * x2 - 3 * x2 * x3 - x1;
hessian(f5);

x = [x1; x2; x3;];
F5s = simplify(1/2*(x.')*H*x+f.'*x);
Hs = hessian(F5s);