clear; clc; close all;

[x_low, Fs] = audioread("music_low_end.wav");
[x_high, ~] = audioread("music_high_end.wav");

disp("Přehrávám nahrávku z levného mikrofonu (low_end)...");
sound(x_low, Fs);
pause(length(x_low)/Fs + 1);

disp("Přehrávám referenční kvalitní nahrávku (high_end)...");
sound(x_high, Fs);
pause(length(x_high)/Fs + 1);

load("h_mic_low_end.mat", "h");

N = 100;
f = 0 : (Fs/2)/N : Fs/2;
H = freqz(h, 1, f, Fs);
ampl = abs(H);

ampl_FIR = 1 ./ ampl;

figure(1);
plot(f, 20*log10(ampl), 'b', 'LineWidth', 1.5);
hold on;
plot(f, 20*log10(ampl_FIR), 'r', 'LineWidth', 1.5);
grid on;
xlabel('Frekvence [Hz]');
ylabel('Amplituda [dB]');
title('Amplitudová charakteristika mikrofonu a kompenzačního filtru');
legend('Mikrofon (h)', 'Kompenzační FIR filtr');

M = 128;
B_FIR = fir2(M, f/(Fs/2), ampl_FIR);

x_vylepseny = filter(B_FIR, 1, x_low);

figure(2);
subplot(2, 1, 1);
spectrogram(x_low, hamming(256), 128, 256, Fs, 'yaxis');
title('Spektrogram: Původní signál (music\_low\_end)');

subplot(2, 1, 2);
spectrogram(x_vylepseny, hamming(256), 128, 256, Fs, 'yaxis');
title('Spektrogram: Vylepšený signál po kompenzaci');

disp("Přehrávám původní signál (low_end)...");
sound(x_low, Fs);
pause(length(x_low)/Fs + 1);

disp("Přehrávám vylepšený signál...");
sound(x_vylepseny, Fs);