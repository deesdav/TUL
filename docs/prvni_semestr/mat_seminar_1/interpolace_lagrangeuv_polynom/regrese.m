function a = regrese(x, y, s)
    V= x.^0;
    for i = 1:s
        V = [x.^i, V];
    end
    a = V\y;
end