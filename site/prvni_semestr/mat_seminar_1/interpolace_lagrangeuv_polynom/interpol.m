function a = interpol(x,y)
    V= x.^0;
    for i = 1:length(x)-1
        V = [x.^i, V];
    end
    a = V \ y;
end