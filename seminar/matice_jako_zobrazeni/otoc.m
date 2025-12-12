function Y = otoc(X, alfa)
    S=[cos(alfa), -sin(alfa); sin(alfa), cos(alfa)];
    Y=S*X;
end