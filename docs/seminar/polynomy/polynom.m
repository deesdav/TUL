function y = polynom(x, a)
    n= length(a)-1;
    y = 0;
    for i = 1:n+1
        y = y + a(i) * x.^(n-i-1);
        
    end
end
% y = polynom(x, [1, -3, 2]);
% plot(x, [y; z]);