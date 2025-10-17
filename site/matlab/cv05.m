clc; close;

% 1

phi = 0:(pi/3):2*pi;
x = cos(phi);
y = sin(phi);

figure;
plot(x, y);
axis equal;

% 2

function result = evaluateFunction(x, y)

    if nargin < 2
        y = 0; 
    end
    result = x.*exp(-x.^2-y.^2)+tanh(x.*y);
end

result1 = evaluateFunction([1, 2, 3]);
disp(result1);

result2 = evaluateFunction([1, 2, 3], [4, 5, 6]);
disp(result2);

% 3

x =-5:0.05:5;

y1 = evaluateFunction(x);
y2 = evaluateFunction(x, 1);
y3 = evaluateFunction(x, 2);

% a

figure;
plot(x, y1, 'DisplayName', 'y = f(x)');
hold on;
plot(x, y2, 'Color', [1, 0.5, 0], 'DisplayName', 'y = f(x,1)');
plot(x, y3, 'Color', [1, 1, 0], 'DisplayName', 'y = f(x,2)');
hold off;
xlabel('x');
ylabel('y');
title('do jednoho grafu');
legend show;

exportgraphics(gcf, 'plot.jpg');
tempFileName = 'temp_plot.png';
exportgraphics(gcf, tempFileName);
img = imread(tempFileName);
imwrite(img, 'plot.bmp');
print(gcf, 'plot.pdf', '-dpdf');
delete(tempFileName);

% b

figure;
ax1 = subplot(3, 1, 1);
plot(x, y1);
title('subplot 1');
xlabel('x');
ylabel('f(x)');

ax2 = subplot(3, 1, 2);
plot(x, y2);
title('subplot 2');
xlabel('x');
ylabel('f(x, 1)');

ax3 = subplot(3, 1, 3);
plot(x, y3);
title('subplot 3');
xlabel('x');
ylabel('f(x, 2)');

linkaxes([ax1, ax2, ax3], 'x');
savefig('subplots.fig');

% 4

x = -5:0.1:5;
y = -6:0.2:6;

[X, Y] = meshgrid(x, y);

Z = evaluateFunction(X, Y);

figure;
surf(X, Y, Z);
title('3D plocha')
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
grid on;