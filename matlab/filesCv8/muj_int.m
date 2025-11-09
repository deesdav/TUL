function vysl = muj_int(f, krok, a, b)
    xr = (a:krok:b) + krok/2;
    vysl = sum(f(xr) * krok);
end
