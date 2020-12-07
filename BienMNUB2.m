clear all;

%ZADANIE 1
dokladnosc=10^(-3);
liczba_iteracji=0;
max_iteracji=100;
x=0;

%METODA SIECZNYCH
ximinus1=10;
xi=5;
deltax=abs(wielomian(x));
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    xiplus1=xi-(xi-ximinus1)/(wielomian(xi)-wielomian(ximinus1))*wielomian(xi);
    deltax=abs(wielomian(xiplus1));
    ximinus1=xi;
    xi=xiplus1;
end
xi
rozwiazania_wielomianu(1,1) = xi;

a=[1 2 -74 -174 965 2944 -20800];
z = xi;
horner(a,z)

%METODA MULLERA I
 xi=-5;
deltax=abs(wielomian2(xi));
liczba_iteracji=0;
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    xiplus1=xi-2*wielomian2(xi)/(pochodna_wielomian2(xi)+sign(pochodna_wielomian2(xi))*sqrt((pochodna_wielomian2(xi))^2-4*0.5*pochodna2_wielomian2(xi)*wielomian2(xi)));
    xi=xiplus1;
    deltax=abs(wielomian2(xi));
end
xi
xi_2 = conj(xi)
rozwiazania_wielomianu(1,2) = xi;
rozwiazania_wielomianu(1,3) = xi_2;

%DEFLACJA KWADRATOWA
a = [1 10 6 -126 -43  2600];
z1_zespolone = xi;
deflacja_kwadratowa(a,z1_zespolone)

%METODA STYCZNYCH
xi=10;
deltax=abs(wielomian3(xi));
liczba_iteracji=0;
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    xiplus1=xi-wielomian3(xi)/pochodna_wielomian3(xi);
    xi=xiplus1;
    deltax=abs(wielomian3(xi));
end
xi
rozwiazania_wielomianu(1,4) = xi;

%DEFLACJA LINIOWA 
a = [1 2 -35 104];
z = xi;
horner(a,z)

%METODA MULLERA II
xi=1;
ximinus1=10;
ximinus2=12;
liczba_iteracji=0;
deltax=abs(wielomian4(xi));
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    A = [-(xi - ximinus1)^2, (xi-ximinus1) ; -(xi - ximinus2)^2, (xi - ximinus2)];
    B=inv(A);
    C = [wielomian4(xi) - wielomian4(ximinus1) ; wielomian4(xi) - wielomian4(ximinus2)];
    D=B*C;
    a = D(1,1);
    b=D(2,1);
    xiplus1=xi-2*wielomian4(xi)/(b+sign(b)*sqrt(b^2-4*a*wielomian4(xi)));
    ximinus2=ximinus1;
    ximinus1=xi;   
    xi=xiplus1;
    deltax=abs(wielomian4(xi));
end
xi
xi_2=conj(xi)
rozwiazania_wielomianu(1,5) = xi;
rozwiazania_wielomianu(1,6) = xi_2;
rozwiazania_wielomianu(1,:)

%ZADANIE 2
clear;
a=[1 2 -74 -174 965 2944 -20800];
r = roots(a);
X = [ r(1) r(4) r(3) r(2) r(6) r(5)];
rozwiazania_roots = round(X);

%DLA METODY SIECZNYCH
x=0;
liczba_iteracji=0;
max_iteracji=100;
ximinus1=10;
xi=5;
deltax=abs(wielomian(x));
dokladnosci = [10^(-3) 10^(-4) 10^(-5) 10^(-6) 10^(-7) 10^(-8) 10^(-9) 10^(-10) 10^(-11) 10^(-12) 10^(-13) 10^(-14) 10^(-15) 10^(-16)];
for i=1:14
    dokladnosc = dokladnosci(i);
    liczba_iteracji=0;
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    xiplus1=xi-(xi-ximinus1)/(wielomian(xi)-wielomian(ximinus1))*wielomian(xi);
    deltax=abs(wielomian(xiplus1));
    ximinus1=xi;
    xi=xiplus1;

end
    rozwiazanie1(i) = xi;
end

%DLA METODY MULLERA I
 xi=-5;
deltax=abs(wielomian2(xi));
liczba_iteracji=0;
for i=1:14
    dokladnosc = dokladnosci(i);
    liczba_iteracji=0;
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    xiplus1=xi-2*wielomian2(xi)/(pochodna_wielomian2(xi)+sign(pochodna_wielomian2(xi))*sqrt((pochodna_wielomian2(xi))^2-4*0.5*pochodna2_wielomian2(xi)*wielomian2(xi)));
    xi=xiplus1;
    deltax=abs(wielomian2(xi));
end
rozwiazanie2(i) = xi;
rozwiazanie2_sprzezone(i) = conj(xi);
end
 
 %DLA METODY STYCZNYCH
 xi=10;
deltax=abs(wielomian3(xi));
liczba_iteracji=0;
for i=1:14
    dokladnosc = dokladnosci(i);
    liczba_iteracji=0;
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    xiplus1=xi-wielomian3(xi)/pochodna_wielomian3(xi);
    xi=xiplus1;
    deltax=abs(wielomian3(xi));
end
rozwiazanie3(i) = xi;
end

 %METODA MULLERA II
for i=1:14
    dokladnosc = dokladnosci(i);
    liczba_iteracji=0;
xi=1;
ximinus1=10;
ximinus2=12;
liczba_iteracji=0;
deltax=abs(wielomian4(xi));
while (deltax>dokladnosc)&&(liczba_iteracji<max_iteracji)
    liczba_iteracji=liczba_iteracji+1;
    A = [-(xi - ximinus1)^2, xi-ximinus1 ; -(xi - ximinus2)^2, xi - ximinus2];
    B=inv(A);
    C = [wielomian4(xi) - wielomian4(ximinus1) ; wielomian4(xi) - wielomian4(ximinus2)];
    D=B*C;
    a = D(1,1);
    b = D(2,1);
    xiplus1=xi-2*wielomian4(xi)/(b+sign(b)*sqrt(b^2-4*a*wielomian4(xi)));
    ximinus2=ximinus1;
    ximinus1=xi;   
    xi=xiplus1;
    deltax=abs(wielomian4(xi));
end
rozwiazanie4(i) = xiplus1;
rozwiazanie4_sprzezone(i) = conj(xiplus1);
end

for i=1:14
rozwiazanie_wektor(i,:) = [rozwiazanie1(i) rozwiazanie2(i) rozwiazanie2_sprzezone(i) rozwiazanie3(i) rozwiazanie4(i) rozwiazanie4_sprzezone(i)];
end



for i=1:14
    blad(i) = norm(rozwiazanie_wektor(i,:) - rozwiazania_roots,2)/norm(rozwiazania_roots,2);
    blad_inf(i) = norm(rozwiazanie_wektor(i,:) - rozwiazania_roots,inf)/norm(rozwiazania_roots,inf);
end

loglog(dokladnosci, blad, 'LineWidth', 1.5);
xlabel('parametr dokładności ∆x');
ylabel('zagregowany blad wzgledny');
hold on;
grid on;
loglog(dokladnosci, blad_inf, 'r','LineWidth', 1.5);
legend({'norma 2','norma ∞'}, 'Location', 'northwest');


%wielomian główny
function y = wielomian(x)
y=x^6 + 2*x^5 - 74*x^4 - 174*x^3 + 965*x^2 + 2944*x - 20800;
end
%pochodna wielomianu głównego
function [y2] = pochodna_wielomian(x)
y2 = 6*x^5 + 10*x^4 - 296*x^3 - 522*x^2 + 1930*x + 2944;
end
%druga pochodna wielomianu głównego
function [y3] = pochodna2_wielomian(x)
y3 = 30*x^4 + 40*x^3 - 888*x^2 - 1044*x + 1930;
end
%wielomian po pierwszej deflacji
function y = wielomian2(x)
y = x^5 + 10*x^4 + 6*x^3 - 126*x^2 - 43*x +2600;
end
%pochodna wielomianu po pierwszej deflacji
function [y2] = pochodna_wielomian2(x)
y2 = 5*x^4 + 40*x^3 + 18*x^2 - 252*x - 43;
end
%druga pochodna wielomianu po pierwszej deflacji
function [y3] = pochodna2_wielomian2(x)
y3 = 20*x^3 + 120*x^2 + 36*x - 252;
end
%wielomian po deflacji kwadratowej
function y = wielomian3(x)
y=x^3 + 2*x^2 - 35*x + 104;
end
%pochodna wielomianu po deflacji kwadratowej
function y2 = pochodna_wielomian3(x)
y2 = 3*x^2 + 4*x - 35;
end
%wielomian po kolejnej deflacji liniowej
function y = wielomian4(x)
y = x^2 - 6*x + 13;
end

function x = horner(a,z)
n=length(a);
m=length(z);
result = a(1)*ones(1,m);
c = a(1)*ones(1,m);
for j=2:n-1
    result = result.*z + a(j);
    c(j) = result;
end
c
end

function y = deflacja_kwadratowa(a,z1_zespolone)
n=length(a);
m=length(z1_zespolone);
p = 2*real(z1_zespolone);
z2_zespolone = conj(z1_zespolone);
r=-(abs(z2_zespolone))^2;
mx = z1_zespolone^2 - p*z1_zespolone - r;
result = a(1)*ones(1,m);
b(n-2) = a(1);
b(n-3) = a(2) + p*b(n-2);
for j=3:(n-2)
    b(n-j-1) = a(j) + p*b(n-j) + r*b(n-j+1);
end
b
end
