function z = zintegruj(x,y,c)
    z(1) = c;
    for i = 1:length(x)-1
        z(i+1) = z(i) + 0.5 * (x(i+1)-x(i)) * (y(i) + y(i+1));
    end
end