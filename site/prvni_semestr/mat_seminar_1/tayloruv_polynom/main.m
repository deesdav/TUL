clc; clear; close all;

% do konzole

x = -4*pi : 0.1 : 4*pi;
d_kratke = [0,1,0,-1,0,1,0,-1,0,1,0,-1];
y = Taylor(x, d_kratke);
plot(x, y);
axis([-4*pi, 4*pi, -2, 2]);
hold on;

z = sin(x);
plot(x,z)
d_dlouhe = [0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1];
y = Taylor(x, d_dlouhe);
plot(x, y);

format compact;
sinus(pi);
sin(pi);
sinus(2);
sin(2);
sinus(20);
sin(20);