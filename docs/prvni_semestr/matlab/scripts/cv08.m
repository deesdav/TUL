clc; clear;

% 1 1
syms x;

krok = 0.01;              
a1 = 0;                      
b1 = 2 * pi; 

analytical_f1(x) = 1/(2+cos(x));
analytical_int1 = int(analytical_f1, x, a1, b1);

numerical_f1 =  @(x) 1 ./ (2 + cos(x)); 
numerical_int1 = muj_int(numerical_f1, krok, a1, b1);

% 1 2

a2 = 0;                      
b2 = sqrt(3); 

analytical_f2(x) = x*atan(x);
analytical_int2 = int(analytical_f2, x, a2, b2);

numerical_f2 = @(x) x.*atan(x);
numerical_int2 = muj_int(numerical_f2, krok, a2, b2);

% 1 3

a3 = 0;                      
b3 = 2*pi; 

analytical_f3(x) = sqrt(1 - sin(x)^2);
analytical_int3 = int(analytical_f3, x, a3, b3);

numerical_f3 =  @(x) sqrt(1 - sin(x).^2);
numerical_int3 = muj_int(numerical_f3, krok, a3, b3);

% 1 4

a4 = -10;
b4 = 5;

analytical_f4(x) = exp(-x^2); 
analytical_int4 = int(analytical_f4, x, a4, b4);

numerical_f4 =  @(x) exp(-x.^2);
numerical_int4 = muj_int(numerical_f4, krok, a4, b4);

% 1 5

a5 = -Inf;
b5 = Inf;

analytical_f5(x) = exp(-x^2); 
analytical_int5 = int(analytical_f5, x, a5, b5);

numerical_f5 = @(x) exp(-x.^2);
numerical_int5 = muj_int(numerical_f5, krok, -1000000, 1000000);

format long;
fprintf('\n=== Úloha 1 ===\n');
fprintf('1) Analyticky: %.6f, Numericky: %.6f\n', double(analytical_int1), numerical_int1);
fprintf('2) Analyticky: %.6f, Numericky: %.6f\n', double(analytical_int2), numerical_int2);
fprintf('3) Analyticky: %.6f, Numericky: %.6f\n', double(analytical_int3), numerical_int3);
fprintf('4) Analyticky: %.6f, Numericky: %.6f\n', double(analytical_int4), numerical_int4);
fprintf('5) Analyticky: %.6f, Numericky: %.6f\n', double(analytical_int5), numerical_int5);

% 2 1
syms n;
fs1 = (-1)^n * (1/(2^(n-1)));
an_sum1 = symsum(fs1, n, 1, Inf);

fs1_n = matlabFunction(fs1);
num_sum1 = sum(fs1_n(1:1000));

% 2 2

fs2 = 1 / (n*(n+1));
an_sum2 = symsum(fs2, n, 1, Inf);

fs2_n = matlabFunction(fs2);
num_sum2 = sum(fs2_n(1:1000));

% 2 3

fs3 = (-1)^n * (1/n);
an_sum3 = symsum(fs3, n, 1, Inf);

fs3_n = matlabFunction(fs3);
num_sum3 = sum(fs3_n(1:1000));

% 2 4

fs4 = (2*n - 1) / 2^n;
an_sum4 = symsum(fs4, n, 1, Inf);

fs4_n = matlabFunction(fs4);
num_sum4 = sum(fs4_n(1:1000));

fprintf('\n=== Úloha 2 ===\n');
fprintf('1) Analyticky: %.6f, Numericky: %.6f\n', double(an_sum1), num_sum1);
fprintf('2) Analyticky: %.6f, Numericky: %.6f\n', double(an_sum2), num_sum2);
fprintf('3) Analyticky: %.6f, Numericky: %.6f\n', double(an_sum3), num_sum3);
fprintf('4) Analyticky: %.6f, Numericky: %.6f\n', double(an_sum4), num_sum4);

% 3

syms a;

A = [1 7 a; a^2 3 1-a; 0 5 6];
f_det1(a) = det(A);

figure;
fplot(f_det1, [-10, 10]);

x_lx1 = solve(diff(f_det1) == 0);
x_lx1 = double(x_lx1);
x_lx1 = x_lx1(imag(x_lx1) == 0);

hold on;
plot(x_lx1, f_det1(x_lx1), 'x', 'MarkerSize', 40);

B = [a 8 -3*a; 1 (1-a)^2 a; 3 -1 4];
f_det2(a) = det(B);

figure;
fplot(f_det2, [-10, 10]);

x_lx2 = solve(diff(f_det2) == 0);
x_lx2 = double(x_lx2);
x_lx2 = x_lx2(imag(x_lx2) == 0);

hold on;
plot(x_lx2, f_det2(x_lx2), 'x', 'MarkerSize', 40);

fprintf('\n=== Úloha 3 ===\n');
disp(double(x_lx1));
disp(double(x_lx2));