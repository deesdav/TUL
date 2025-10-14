clc; close;
x=-4*pi:0.1:4*pi;

function y = Taylor(x, d)
    y=0;
    for i = 1:length(d)
        y=y+d(i)/factorial(i-1)*x.^(i-1);
    end
end

y=Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1]);
plot(x,y)
axis([-4*pi, 4*pi, -2, 2]);
hold on;
z=sin(x);
plot(x, z);
y=Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1]);
plot(x, y);

function y=sinus(x)
    z=floor(x/2/pi);
    x=x-2*pi*z;
    y=Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1]);
end

format compact;
sinus(pi);
sin(x);
sin(pi);
sinus(pi);
sinus(2);
sin(2);
sinus(20);
sin(20);
sinus(20);