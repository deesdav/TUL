clear; clc; close all;

x = [1 2 3 2 1];
h = [4 3 2 1];

y_moje = my_conv(x, h);
y_matlab = conv(x, h);

disp('Vlastní my_conv:');
disp(y_moje);
disp('Vestavěný conv:');
disp(y_matlab);

if isequal(y_moje, y_matlab)
    disp('Konvoluce je správná.');
else
    disp('Konvoluce není správná.');
end

[x1, Fs] = audioread('pozdrav.wav');
x1 = x1'; 

h1 = [1 -1];
y1 = conv(x1, h1);

figure(1);
subplot(2, 1, 1);
spectrogram(x1, 256, 128, 256, Fs, 'yaxis');
title('Spektrogram: x1 (pozdrav)');

subplot(2, 1, 2);
spectrogram(y1, 256, 128, 256, Fs, 'yaxis');
title('Spektrogram: y1 = conv(x1, h1)');

disp('Úloha 5: Přehrávám x1 a y1...');
sound(x1, Fs);
pause(length(x1)/Fs + 1);
sound(y1, Fs);
pause(length(y1)/Fs + 1);


N_dozvuk = round(0.025 * Fs);
h2_dozvuk = [1, zeros(1, N_dozvuk), 0.5, zeros(1, N_dozvuk), 0.25, zeros(1, N_dozvuk)];
y2_dozvuk = conv(x1, h2_dozvuk);

disp('Úloha 6a: Přehrávám dozvuk...');
sound(y2_dozvuk, Fs);
pause(length(y2_dozvuk)/Fs + 1);

N_ozvena = round(0.3 * Fs);
h2_ozvena = [1, zeros(1, N_ozvena), 0.5, zeros(1, N_ozvena), 0.25, zeros(1, N_ozvena)];
y2_ozvena = conv(x1, h2_ozvena);

disp('Úloha 6b: Přehrávám ozvěnu...');
sound(y2_ozvena, Fs);
pause(length(y2_ozvena)/Fs + 1);

[h3, Fs_h3] = audioread('hala.wav');
h3 = h3';
y3 = conv(x1, h3);

[h4, Fs_h4] = audioread('kostel.wav');
h4 = h4';
y4 = conv(x1, h4);

disp('Úloha 7: Přehrávám halu...');
sound(y3, Fs);
pause(length(y3)/Fs + 1);

disp('Úloha 7: Přehrávám kostel...');
sound(y4, Fs);

function y = my_conv(x, h)
    Nx = length(x);
    Nh = length(h);
    Ny = Nx+Nh-1;
    y = zeros(1, Ny);
    for i = 1:Nx
        y = y+[zeros(1, i-1), x(i)*h, zeros(1, Nx-i)];
    end
end