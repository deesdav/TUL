clc; close all; clear;

x = [0,1,0.9,1,0.9];
y = [0,0,0.1,0,-0.1];
plot(x, y);
axis equal;

% Tohle jsme psali do command line

zobraz(zvetsi(jednanula,2))
zobraz(zvetsi(jednanula,2))
hold on
zobraz(jednanula)
hold on
zobraz(posun(jednanula,[1;0.5]))
zobraz(posun(jednanula,[1;0.5]))
zobraz(posun(zvetsi(jednanula,2),[1;0.5]))
zobraz(zvetsi(posun(jednanula,[1;0.5]),2))