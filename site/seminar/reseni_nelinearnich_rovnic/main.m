function [x,i] = pulint(a, b, g, eps)
if g(a)*g(b)>0 || (eps <= 0)
    x = NaN;
    i = -1;
    return
end
i=0;
while eps<abs(b-a)
    s = (a+b)/2;
    i = i + 1;
    if g(a)*g(s) > 0
        a=s;
    else 
        b=s;
    end 
end
x=(a+b)/2;
end 
 
format compact;
format long;

% testovani

pulint(0.1, 10, @log, 0.0001);
[x,i]=pulint(3, 10, @log, 0.000001);
[x,i]=pulint(10, 0.1, @log, 0.000001);
[x,i]=pulint(0.1, 10, @log, 0);
[x,i]=pulint(-80, 80, @sind, 0.00001);
[x,i]=pulint(-190, 190, @sind, 0.00001);
[x,i]=pulint(-19000, 19020, @sind, 0.00001)