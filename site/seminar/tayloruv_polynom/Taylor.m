function y = Taylor(x, d)
    y=0;
    for i = 1:length(d)
        y=y+d(i)/factorial(i-1)*x.^(i-1);
    end
end