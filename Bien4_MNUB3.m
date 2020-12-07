clear all
%ZADANIE 1
y=@(x)(x.^6 + 2.*x.^5 - 74.*x.^4 - 174.*x.^3 + 965.*x.^2 + 2944.*x - 20800);
x1=-8;                 %przedziały całkowania
x2=8;
I_dokladne=integral(y,x1,x2);
%ZADANIE 2
I_przyblizone=0;
dokladnosc = 4*10^(-7);
wspolczynniki = [1,1,0,0,0,0,0; 1,4,1,0,0,0,0; 1,3,3,1,0,0,0;7,32,12,32,7,0,0;19,75,50,50,75,19,0;41,216,27,272,27,216,41];

for N=2:6
    liczba_podprzedzialow = -5;             %zwiększenie liczby podprzedziałow o 6 w 1.przypadku wyniesie 1
    delta_I = I_przyblizone - I_dokladne;
    wybrany_wspolczynniki = sum(wspolczynniki(N,:));
    wezly_1 = linspace(x1,x2,N+1)';
    wartosc_prostej(N) = (wspolczynniki(N,1:N+1)*y(wezly_1))*(x2-x1)/wybrany_wspolczynniki;
  
    while (abs(delta_I)>dokladnosc)
         suma=0;
         liczba_podprzedzialow = liczba_podprzedzialow+6;
         x1x2 = linspace(x1,x2,liczba_podprzedzialow+1);
         for proste = 1:liczba_podprzedzialow
             wezly_2 = linspace(x1x2(proste), x1x2(proste+1),N+1);
             wartosc_prostych(N) = sum(wspolczynniki(N,1:N+1).*y(wezly_2))*(x1x2(proste+1)-x1x2(proste))/wybrany_wspolczynniki;
             suma = suma+wartosc_prostych(N);
         end
         delta_I = abs(suma - I_dokladne);     
    end
    
 delta_I;
 podprzedzialy(N) = liczba_podprzedzialow;
 end
 podprzedzialy 
 
 figure(1)
 N=[1 2 3 4 5 6];
 semilogy(N,podprzedzialy)
 xlabel('N')
 ylabel('liczba podprzedziałów')
 title('liczba podprzedziałów')
 
 figure(2)
 N=[1 2 3 4 5 6]; 
 krok_calkowania = abs(x1-x2)./podprzedzialy;
 semilogy(N,krok_calkowania)
 xlabel('N')
 ylabel('krok całkowania')
 title('krok całkowania')
 
 %ZADANIE 3
N=10;
max_wartosc_wielomianu = 42151;        %maksymalna zaokrąglona wartość + 1
P = (x2-x1)*max_wartosc_wielomianu;     %pole prostokąta dla wybranego przedziału
%LOSOWANIE RÓWNOMIERNE
i = 1;
while (N<=10000)
    Mx = (linspace(x1,x2,N));       %podział x
    My = (linspace(0,-42151,N));
    N            %wyeświetlanie N - pomocne przy określaniu miejsca pracy
    [xn,yn] = meshgrid(Mx,My); 
    xn = reshape(xn,1,[]);
    yn = reshape(yn,1,[]);
    %losowe wyznaczanie xn i yn
    punkty_pod_wykresem1 = length(find(yn>=y(xn)))/(N*N);
    I_obliczone1 = punkty_pod_wykresem1*P;
    I_ob1(i) = I_obliczone1;
    delta_I1(i) = abs(abs(I_obliczone1) - abs(I_dokladne));
    
    %LOSOWANIE PRZYPADKOWE
    xn = rand(N*N,1)*(x2-x1) - 8;      %losowe wyznaczanie xn i yn
    yn = rand(N*N,1)*42151*(-1);
    punkty_pod_wykresem2 = length(find(yn>=y(xn)))/(N*N);      %wyszukiwanie punktów pod wykresem (warunek ze względu na ujemne wartości przyjmowane przez funkcje)
    I_obliczone = punkty_pod_wykresem2*P;
    I_ob2(i) = I_obliczone;
    delta_I2(i) = abs(abs(I_obliczone) - abs(I_dokladne));
    Ns(i) = N;
    i = i + 1;
    if (N<100)&&(10<=N)
        N = N+10;
        continue
    elseif (N<1000)&&(100<=N)
        N = N+100;
        continue
    else 
        N = N+1000;
        continue
    end
end

 figure(3)
 loglog(Ns,delta_I1)
 hold on
 loglog(Ns,delta_I2)
 xlabel('N')
 ylabel('delta I')
 title('delta I')
 
 figure(4)
 semilogx(Ns,I_ob1)
 hold on
 semilogx(Ns,I_ob2)
 xlabel('N')
 ylabel('wartosc I')
 title('wartosc I')