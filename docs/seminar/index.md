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

## Gaussova eliminace

![](gaussova_eliminace/1.jpg)
![](gaussova_eliminace/2.jpg)
![](gaussova_eliminace/3.jpg)
![](gaussova_eliminace/4.jpg)
![](gaussova_eliminace/5.jpg)

### matice.m

```matlab
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
B = [1, 4, 7; 2, 5, 8; 3, 6, 9];

disp(A+B);
disp(A*B);
disp(B*A);
M = [2, 1, 0, 0; 1, 2, 1, 0; 0, 1, 2, 1; 0, 0, 1, 2];
b = [3;4;4;3];
dips(inv(M));
disp(inv(M)*M);
disp(M*inv(M));
disp(M\b);
disp(M*[1;1;1;1]);
```

## Interpolace, Lagrangeův polynom a Regrese

![](interpolace_lagrangeuv_polynom/1.jpg)
![](interpolace_lagrangeuv_polynom/2.jpg)
![](interpolace_lagrangeuv_polynom/3.jpg)
![](interpolace_lagrangeuv_polynom/4.jpg)
![](interpolace_lagrangeuv_polynom/6.jpg)
![](interpolace_lagrangeuv_polynom/5.jpg)

### main.m

```matlab
x=[1;2];
format compact;
y =[1;2];
V=[x,x.^0];
a=V\y;
xx=0:0.1:3;
yy= polynom(xx, a);
plot(xx,yy);
hold on;
plot(x, y, 'ro');
x=[-1;0;1];
y=[-1;0;1];
V=[x.^2,x,x.^0];
a=V\y;
xx= -2:0.1:2;
yy= polynom(xx, a);
plot(xx, yy);
hold on;
plot(x,y,'ro');
a=interpol(x,y);
x=[-3;-2;-1;0;1;2];
y=[1;0;1;0;1;0;1];
a=interpol(x,y);
xx=-4:0.1:4;
yy=polynom(xx, a);
plot(xx, yy);
hold on;
plot(x,y,'ro');
x=[-1;0;1;2;4];
y=[-1;0;1;2;3];
a=regrese(x,y,1);
xx=0:0.1:5;
yy=polynom(xx, a);
plot(xx, yy);
hold on;
plot(x, y, 'ro');

```

### interpol.m

```matlab
function a=interpol(x,y)
V=x.^0;
for i = 1:length(x)-1
    V = [x.^i, V];
end
a = V\y;
end
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
```

### regrese.m

```matlab
function a=regrese(x,y)
V=x.^0;
for i = 1:length(x)-1
    V = [x.^i, V];
end
a = V\y;
end
```

## Řešení nelineárních rovnic

![](reseni_nelinearnich_rovnic/1.jpg)

### Metoda půlení intervalu

![](reseni_nelinearnich_rovnic/2.jpg)

### main.m

```matlab
function [x,i] = pulint(a, b, g, eps)
if g(a)*g(b)>0 || (eps <= 0)
    x = NaN;
    i = -1;
    return
end
i=0;
while eps<abs(b-a)
    s = (a+b)/2;
    i = i + 1;
    if g(a)*g(s) > 0
        a=s;
    else
        b=s;
    end
end
x=(a+b)/2;
end

format compact;
format long;

% testovani

pulint(0.1, 10, @log, 0.0001);
[x,i]=pulint(3, 10, @log, 0.000001);
[x,i]=pulint(10, 0.1, @log, 0.000001);
[x,i]=pulint(0.1, 10, @log, 0);
[x,i]=pulint(-80, 80, @sind, 0.00001);
[x,i]=pulint(-190, 190, @sind, 0.00001);
[x,i]=pulint(-19000, 19020, @sind, 0.00001)
```

## Newtonova metoda

![](newtonova_metoda/1.jpg)
![](newtonova_metoda/2.jpg)

### main.m

```matlab
clc; clear all; close all;

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

format long;
format compact;
Newton(0.1, @log, 1e-6, 100, 1e-8)
Newton(91, @sind, 1e-6, 100, 1e-8)
x=-4:0.01:4;
y=sin(x);
z=zderivuj(x,y);
plot(x,z);
hold on;
plot(x, cos(x));
y=x.^2;
z=zderivuj(x,y);
plot(x,z);
```

### zderivuj.m

```matlab
function z = zderivuj(x,y)
z(length(x))=NaN;
for i = 1:length(x) - 1
    z(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
end

end
```

## Numerické integrování

![](numericke_integrovani/1.jpg)
![](numericke_integrovani/2.jpg)

### Obdélníková metoda a lichoběžníková metoda

![](numericke_integrovani/3.jpg)

![](numericke_integrovani/4.jpg)

### main.m

```matlab
clc; close all; clear;

function I = Integral(x,y)
I = 0;
for i = 1:length(x)-1
    I = I + 0.5 * (x(i+1)-x(i) * y(i) + y(i+1));
end
end

format long;
format compact;

x= 0:1;
y=x;
Integral(x,y)

x= -1:0.0001:1;
y=sqrt(1-x.^2);
2*Integral(x,y);
axis equal;
plot(x,y);

x=0:0.1:2*pi;
y = cos(x);
z=zintegruj(x,y);
plot(x,z);
hold on;
plot(x, sin(x));
y=sin(x);
z=zintegruj(x,y);
plot(x,z);
hold on;
plot(x, -cos(x)+1);
z=zintegruj(x,y,-1);
plot(x,z);
hold on;
plot(x,-cos(x));
Y=zderivuj(x, z);
plot(x, Y);
hold on;
plot(x,y);
x=1:0.01:10;
y=log(x);
z=zderivuj(x,y);
plot(x,z);
hold on;
plot(x,1./x);
Y=1./x;
Z=zderivuj(x,Y,0);
plot(x,Z);
hold on;
plot(x, log(x));
```

### zintegruj.m

```matlab
function z = zintegruj(x,y,c)
z(1) = c;
for i = 1:length(x)-1
    z(i+1) = z(i) + 0.5 * (x(i+1)-x(i) * y(i) + y(i+1));
end
end


```

## Matice jako zobrazení

![](matice_jako_zobrazeni/1.jpg)
![](matice_jako_zobrazeni/2.jpg)
![](matice_jako_zobrazeni/3.jpg)

### main.m

```matlab
clc; close all; clear;

x = [0,1,0.9,1,0.9];
y = [0,0,0.1,0,-0.1];
plot(x, y);
axis equal;

% Tohle jsme psali do command line

zobraz(zvetsi(jednanula,2))
zobraz(zvetsi(jednanula,2))
hold on
zobraz(jednanula)
hold on
zobraz(posun(jednanula,[1;0.5]))
zobraz(posun(jednanula,[1;0.5]))
zobraz(posun(zvetsi(jednanula,2),[1;0.5]))
zobraz(zvetsi(posun(jednanula,[1;0.5]),2))
zobraz(otoc(jednanula, pi/3))
zobraz(vektorrofi(5, pi/2))
zobraz(domecek)
format compact
D= [2,0;0,3];
hold on
zobraz(D*domecek)
E=[1,0;0,1];
row1 = [1, -1];
row2 = [1,  1];
S45 = 1/sqrt(2) * [row1; row2];
zobraz(E*domecek)
zobraz(S45*domecek)
zobraz(D*S45*domecek)
zobraz(S45*D*domecek)
F=[3,1;1,3];
zobraz(domecek)
hold on
zobraz(F*domecek)
zobraz(domecek)
zobraz(vektor([-1;1]))
zobraz(vektor(F*[-1;1]))
[V,G] = eig(F);
[V,G] = eig(D);
[V,G] = eig(E);
H = [-3,1;1,3];
[V,G] = eig(H);
zobraz(domecek)
hold on
zobraz(H*domecek)
x=V(:,1);
zobraz(vektor(x))
zobraz(vektor(H*x))
xx=V(:,2);
zobraz(vektor(xx))
zobraz(vektor(H*xx))
zobraz(domecekk)
hold on
zobraz(H*domecekk)
Dd = [2,0;0,0];
[V,G] = eig(Dd);
zobraz(Dd*domecekk)
```

### jednanula.m

```matlab
function X = jednanula
    X = [0,1,0.9,1,0.9 ; 0,0,0.1,0,-0.1];
end
```

### zobraz.m

```matlab
function zobraz(X)
    x = X(1,:);
    y = X(2,:);
    plot(x, y);
    axis equal;
end
```

### zvetsi.m

```matlab
function Y = zvetsi(X,k)
    Y = X * k;
end
```

### posun.m

```matlab
function Y = posun(X,x0)
    % Y(1,:) = X(1,:) + x0(1);
    % Y(2,:) = X(2,:) + x0(2);
    Y = X+x0;
end
```

### otoc.m

```matlab
function Y = otoc(X, alfa)
    S=[cos(alfa), -sin(alfa); sin(alfa), cos(alfa)];
    Y=S*X;
end
```

### vektor.m

```matlab
function Y = vektor(x)
    ro = sqrt(x(1)^2+x(2)^2);
    fi = atan(x(2)/x(1));
    if x(1) < 0
        fi= fi+pi;
    end
    Y = vektorrofi(ro,fi);
end
```

### vektorrofi.m

```matlab
function Y = vektorrofi(ro,fi)
    Y = otoc(zvetsi(jednanula, ro), fi);
end
```

### domecek.m

```matlab
function Y = domecek
    Y = [0,1,0,1,0,0,0.5,1,1;0,0,1,1,0,1,1.5,1,0];
end
```

### domecekk.m

```matlab
function Y = domecekk
    Y = [0,1,0,1,0,0,0.5,1,1,1;0,0,1,1,0,1,1.5,1.5,1,0];
end
```
