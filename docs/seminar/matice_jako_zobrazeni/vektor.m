function Y = vektor(x)
    ro = sqrt(x(1)^2+x(2)^2);
    fi = atan(x(2)/x(1));
    if x(1) < 0
        fi= fi+pi;
    end
    Y = vektorrofi(ro,fi);
end