clear; clc; close all;

% T1 = 1/100;
% T4 = 4*T1;
% Fs = 8000;
% 
% t = 0 : 1/Fs : T4 - 1/Fs;
% 
% A = 5;
% x = A * cos(2*pi*100*t);
% plot(t, x);

f = 100;
T1 = 1/f;
T3 = 3 * T1;
Fs = 16000;

t = 0 : 1/Fs : T3 - 1/Fs;

x = zeros(size(t));
for k = 1:2
    n = 2*k - 1;
    x = x + (1/n) * cos(2*pi*n*f*t - pi/2);
end
x = (4/pi) * x;
subplot(2, 2, 1);
plot(t, x);
title('2 složky');

x = zeros(size(t));
for k = 1:8
    n = 2*k - 1;
    x = x + (1/n) * cos(2*pi*n*f*t - pi/2);
end
x = (4/pi) * x;
subplot(2, 2, 2);
plot(t, x);
title('8 složky');

x = zeros(size(t));
for k = 1:16
    n = 2*k - 1;
    x = x + (1/n) * cos(2*pi*n*f*t - pi/2);
end
x = (4/pi) * x;
subplot(2, 2, 3);
plot(t, x);
title('16 složky');

x = zeros(size(t));
for k = 1:32
    n = 2*k - 1;
    x = x + (1/n) * cos(2*pi*n*f*t - pi/2);
end
x = (4/pi) * x;
subplot(2, 2, 4);
plot(t, x);
title('32 složky');

