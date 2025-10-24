clc; close;

f = @(x) atan((x+1)./(x-1));
g = @(x) x./sqrt(x.^2 - 1);
h = @(x) x.^x;

x = -10:0.01:10;

y1 = f(x);
y1(x==1) = nan;

fig1 = figure;
plot(x, y1);
xlabel('x');
ylabel('f(x)');
title('Plot of f(x)');

y2 = g(x);
y2(imag(y2)~=0)=nan;

fig2 = figure;
plot(x, y2);
xlabel('x');
ylabel('g(x)');
title('Plot of g(x)');

y3 = h(x);
y3(imag(y3) ~= 0) = nan;
y3(isinf(y3)) = nan; 

fig3 = figure;
plot(x, y3);
xlabel('x');
ylabel('h(x)');
title('Plot of h(x)');


saveas(fig1, 'f.eps', 'epsc');
saveas(fig2, 'g.eps', 'epsc');
saveas(fig3, 'h.eps', 'epsc');


