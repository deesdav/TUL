function I = Integral(x,y)
    I = 0;
    for i = 1:length(x)-1
        I = I + 0.5 * (x(i+1)-x(i)) * (y(i) + y(i+1));
    end
end