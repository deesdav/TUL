# Matematika Seminář

## Info

Matematika Seminář je předmět nabízený Katedrou matematiky a didaktiky matematiky na Fakultě přírodovědně-humanitní a pedagogické TUL. Seminář se zaměřuje na procvičování a prohlubování znalostí z matematiky, zejména:

- Goniometrické funkce (sinus, kosinus, tangens, kotangens, jejich grafy a vlastnosti)
- Kuželosečky (elipsa, parabola, hyperbola, rovnice a geometrické vlastnosti)

Seminář je určen pro studenty, kteří chtějí zlepšit své schopnosti v řešení matematických problémů a připravit se na pokročilejší kurzy. Informace o termínech a přihlášení jsou dostupné na webu Katedry matematiky TUL.

## Goniometrické funkce

- sin - protilehlá/přepona - a/c
- cos - přilehlá / přepona - b/c
- tg - přilehlá / protilehlý - a/b
- tg = sin / cos

![](./goniometricke_funkce/1.jpg)
![](./goniometricke_funkce/2.jpg)
![](./goniometricke_funkce/3.jpg)
![](./goniometricke_funkce/4.jpg)

## Kuželosečky

![](./kuzelosecky/kuželosečky 1.jpg)
![](./kuzelosecky/kuželosečky 2.jpg)
![](./kuzelosecky/kuželosečky 3.jpg)
![](./kuzelosecky/kuželosečky 4.jpg)
![](./kuzelosecky/kuželosečky 5.jpg)
![](./kuzelosecky/kuželosečky 6.jpg)

## Polynomy

![](./polynomy/1.jpg)
![](./polynomy/2.jpg)
![](./polynomy/3.jpg)
![](./polynomy/4.jpg)

### seminar_polynomy.m

```matlab
clear; clc;

x=0:0.1:3;
y=x.^2-3*x+2;
plot(x, y);
z=0*x;
plot(x,[y;z]);
y=2*y;
plot(x,[y;z]);
```

### polynom.m

```matlab
function y = polynom(x, a)
    n= length(a)-1;
    y = 0;
    for i = 1:n+1
        y = y + a(i) * x.^(n-i-1);

    end
end
% y = polynom(x, [1, -3, 2]);
% plot(x, [y; z]);
```

## Taylorův polynom

![](tayloruv_polynom/1.jpg)
![](tayloruv_polynom/2.jpg)
![](tayloruv_polynom/3.jpg)
![](tayloruv_polynom/4.jpg)
![](tayloruv_polynom/5.jpg)
![](tayloruv_polynom/6.jpg)

### taylor.m

```matlab
clc; close;
x=-4*pi:0.1:4*pi;

function y = Taylor(x, d)
    y=0;
    for i = 1:length(d)
        y=y+d(i)/factorial(i-1)*x.^(i-1);
    end
end

y=Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1]);
plot(x,y)
axis([-4*pi, 4*pi, -2, 2]);
hold on;
z=sin(x);
plot(x, z);
y=Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1]);
plot(x, y);

function y=sinus(x)
    z=floor(x/2/pi);
    x=x-2*pi*z;
    y=Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1]);
end

format compact;
sinus(pi);
sin(x);
sin(pi);
sinus(pi);
sinus(2);
sin(2);
sinus(20);
sin(20);
sinus(20);
```
