function [x,i] = pulint(a, b, g, eps)
    if g(a)*g(b) > 0 || (eps <= 0)
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