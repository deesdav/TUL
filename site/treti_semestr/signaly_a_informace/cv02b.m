clear; clc; close all;

A = imread('cislice5.png');

figure;
subplot(3,1,1);
imshow(A);

A_double = im2double(A);
minA = min(A_double(:));
maxA = max(A_double(:));

B_double = (A_double - minA) / (maxA - minA) * 255;
B = uint8(B_double);

subplot(3,1,2);
imshow(B);

C = B;
w = 2;
C(1:w, :) = 0;
C(end-w+1:end, :) = 0;
C(:, 1:w) = 0;
C(:, end-w+1:end) = 0;

subplot(3,1,3);
imshow(C);