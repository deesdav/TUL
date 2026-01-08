function x = Newton(x0, g, eps, maxiter, delta)
    i = 0;
    xi = x0;
    while i < maxiter && abs(g(xi)) > eps
        xi = xi-delta*g(xi)/(g(xi+delta)-g(xi));
        i = i + 1;
    end
    if abs(g(xi)) < eps
        x = xi;
    else
        x = NaN;
    end
end