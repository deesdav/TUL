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