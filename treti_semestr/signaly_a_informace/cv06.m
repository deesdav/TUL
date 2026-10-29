clear; clc; close all;

Fs = 8000;
T = 1;
t = 0 : 1 / Fs : T - 1 / Fs;

y1 = cos(2 * pi * 200 * t);
y2 = cos(2 * pi * 800 * t + pi);
y3 = cos(2 * pi * 1000 * t);

y = y1 + y2 + y3;

subplot(5, 1, 1);
plot(t, y1);
xlim([0 0.05]);
ylim([-2 2]);
title('y1 = cos(2 * pi * 200 * t) Fs = 8000');

subplot(5, 1, 2);
plot(t, y2);
xlim([0 0.05]);
ylim([-2 2]);
title('y2 = cos(2 * pi * 800 * t + pi) Fs = 8000');

subplot(5, 1, 3);
plot(t, y3);
xlim([0 0.05]);
ylim([-2 2]);
title('y3 = cos(2 * pi * 1000 * t) Fs = 8000');

subplot(5, 1, 4);
plot(t, y);
xlim([0 0.05]);
ylim([-2 2]);
title('y = y1 + y2 + y3 Fs = 8000');

subplot(5, 1, 5);
spectrogram(y, 256, 128, 512, Fs, 'yaxis');
xlabel('Time (ms)');
ylabel('Frequency (kHz)');
title('y = y1 + y2 + y3 Fs = 8000');