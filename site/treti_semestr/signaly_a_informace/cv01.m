clear; clc; close all;

faze = 0 : pi/4 : 7*pi/4;
modul = 1;
for i = 1:8
    z(i) = modul * exp(1i * faze(i));
end

grid on;
hold on;
axis equal;
xlim([-2 2]);
ylim([-2 2]);

for i = 1:8
    plot(real(z(i)), imag(z(i)), 'X');
end