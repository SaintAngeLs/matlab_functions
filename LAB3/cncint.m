function Q = cncint(f, a, b, n ,M)
% cncint(f, a, b, n ,M) - funkcja przybliżająca wartośc całki z funkcji
% ciągłej f na przedziale [a, b] opisaną powyżej kwardaturą złożoną.
% Argument f jest uchwytem do funkcji akceptującej wektor/macierz, a i b są
% końcami przedziału całkowania (a<b). n zawsze należy do zbioru
% {2,3,4,5,6,7}, maksymalna liczba M nie przekroczy 50*(10^6).
% n = 2: współczynniki kwadratury (1/2, 1/2)
% n = 3: współczynniki kwadratury (1/6, 4/6, 1/6)
% n = 4: współczynniki kwadratury (1/8, 3/8, 3/8, 1/8)
% n = 5: współczynniki kwadratury (7/90, 32/90, 12/90, 32/90, 7/90)
% n = 6: współczynniki kwadratury (19/90, 75/288, 50/288, 50/288, 75/288, 
% 19/288)
% n = 7: współczynniki kwadratury (41/840, 216/840, 27/840, 272/840, 
% 27/840, 216/840, 41/840)
% n - liczba węzłów kwadratury proste. Np. n = 2 mamy do czynienia z
% kwadraturą trapezów, dla n = 3, mamy do czynienia z kwadrarturą Simsona
%, dla n = 4 z kwardaturą Newtona "3/8". Zaimplementować złożonej z  M 
% przedziałów kwadratury Newtona-Kotesa.
% przedział całkowania [a,b] należy podzielić na M podprzedziałów i w
% każdym z nich zastosować prostą n-węsłową kwadraturę Newtona-Kotesa
% Wejście:
% f - uchwyt do funkcji ciągłej na przediale [a,b] (a < b) dla której 
% przybliżona wartość całki jest liczona
% a - lewy koniec przedziłu całkowania
% b - prawy koniec przedziłu całkowania
% n - liczba węzłów kwadratury Newtona-Kotesa rżedu n
% M - liczba podziałów przedziału [a,b]
% Wyjście:
% Q - przybliżona wartośc całki obliczona ze wzoru Nowtona-Kotesa rzędu n
% Autor: Andrii Voznesenskyi

% szerokość podprzedziałów
h = (b - a) / M;

% długości podprzedziałów
interv = a:h:b;  

% Węzły dla każdego podprzedziału
x = repmat(interv(1:end-1), n, 1) + repmat((0:n-1)' / (n-1), 1, M) * h;

% Przybliżona wartość całki otrzymana z kwadratury na wspóczynnikach n
Q = ncnorder(f,x,h,n);
end % function

