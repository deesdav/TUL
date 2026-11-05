clear; clc; close all;

Fs = 10;
T = 2;
t = 0 : 1/Fs : T - 1/Fs;

s1 = cos(2 * pi * 4 * t);
s2 = cos(2 * pi * 2.5 * t);

N = 10;
X = DFT(s1, N);
f_axis = (0 : N/2) * (Fs / N);
X_onesided = abs(X(1 : N/2 + 1));
subplot(2, 2, 1);
stem(f_axis, X_onesided);
title('f = 4 Hz, N = 10');
xlabel('f [Hz]'); ylabel('|X|');

N = 20;
X = DFT(s1, N);
f_axis = (0 : N/2) * (Fs / N);
X_onesided = abs(X(1 : N/2 + 1));
subplot(2, 2, 2);
stem(f_axis, X_onesided);
title('f = 4 Hz, N = 20');
xlabel('f [Hz]'); ylabel('|X|');

N = 10;
X = DFT(s2, N);
f_axis = (0 : N/2) * (Fs / N);
X_onesided = abs(X(1 : N/2 + 1));
subplot(2, 2, 3);
stem(f_axis, X_onesided);
title('f = 2.5 Hz, N = 10');
xlabel('f [Hz]'); ylabel('|X|');

N = 20;
X = DFT(s2, N);
f_axis = (0 : N/2) * (Fs / N);
X_onesided = abs(X(1 : N/2 + 1));
subplot(2, 2, 4);
stem(f_axis, X_onesided);
title('f = 2.5 Hz, N = 20');
xlabel('f [Hz]'); ylabel('|X|');

function X = DFT(x, N)
x = x(1:N);
X = zeros(1, N);
for k = 0:N-1
    sum = 0;
    for n = 0:N-1
        sum = sum + x(n+1) * exp(-1j * 2 * pi * k * n / N);
    end
    X(k+1) = sum / N;
end
end