clear; clc; close all;

Fs = 16000; % Hz
Tc = 0.3; % s
A = 0.1;

n = [
    -2, -2, -5,         -2, -2, -5,...
    -2, -2,  0, -2,     -4, -7,...
    -4, -4, -7,         -4, -4, -7,...
    -4, -4, -2, -4,     -5, -7, -9
];

beats = [
    1, 1, 2,            1, 1, 2,...
    1, 1, 1, 1,         2, 2,...
    1, 1, 2,            1, 1, 2,...
    1, 1, 1, 1,         1, 1, 2
];

lengths = beats * Tc;
q = 2^(1 / 12); % 12 odmoc. ze 2
freqeunces = 440 * (q .^ n);

track = [];

for i = 1:length(freqeunces)
    f = freqeunces(i);
    T = lengths(i);

    t = 0 : 1/Fs : T-1/Fs;

    tone = A * sin(2 * pi * f * t);
    pause = zeros(1, round(Fs * T * 0.1));

    track = [track, tone, pause];
end

sound(track, Fs);