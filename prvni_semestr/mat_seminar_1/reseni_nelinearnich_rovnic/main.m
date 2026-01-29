clc; clear; close all;

% do konzole
format compact;
format long;

pulint(0.1, 10, @log, 0.0001);
[x,i]=pulint(3, 10, @log, 0.000001);
[x,i]=pulint(10, 0.1, @log, 0.000001);
[x,i]=pulint(0.1, 10, @log, 0);
[x,i]=pulint(-80, 80, @sind, 0.00001);
[x,i]=pulint(-190, 190, @sind, 0.00001);
[x,i]=pulint(-19000, 19020, @sind, 0.00001)