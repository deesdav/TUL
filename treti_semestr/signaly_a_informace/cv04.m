clear; clc; close all;

[signal, Fs] = audioread("c9_p0635_s04.wav");

signal_length = length(signal);

t = 0 : 1/Fs : (signal_length-1)/Fs;
sound(signal, Fs);

subplot(3, 1, 1);
plot(t, signal);

L = round(0.02 * Fs);

E = [];

for i = 1 : L : (signal_length - L + 1)
    piece = signal(i : i + L - 1);
    piece_energy = sum(piece .^ 2);
    E = [E, piece_energy];
end

t_E = (0 : length(E) - 1) * 0.02;

subplot(3, 1, 2);
plot(t_E, E);

dE = [];

for i = 2 : length(E)
    difference = E(i) - E(i-1);
    dE = [dE, difference];
end

t_dE = (0 : length(dE) - 1) *0.02;

subplot(3, 1, 3);
plot(t_dE, dE);

