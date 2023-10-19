function y = xsin3(x)
% Autor: Andrii Voznesenskyi, 323538
% xsin(x) - funkcja obliczania możliwie najbardziej dokładnej wartości 
% funkcji f(x) = (sin(x) - x)*x^(-3) dla niezerowych argumentów należących
% do przedziału [-8*pi, 8*pi], gdzie x jest dowolnym wektorem o elementach 
% rzeczywistych x_i (skalar traktuje się jago szczególny przypadek
% wektora), którego rozmiar nie przekracza 25*10^6, oraz dla którego
% zachodzą warunki: x_i >= -8*pi, x_i <= 8*pi, x_i != 0, i \in N.
% Wynik y ma być wektorem o takim samym ułożeniu(pion, poziom) i rozmiarze,
% jak wektor x, a każdy element y_i wektora y ma być w (możliwie
% najlepszym przybliżeniu) równy y_i = (sin(x_i) - x_i)*x^(-3)
% Wejście:
%   x  -  dowolny wektor o elementach rzeczywistych x_i (skalar 
%         traktuje się jago szczególny przypadek
%         wektora), którego rozmiar nie przekracza 25*10^6, oraz dla 
%         którego zachodzą warunki: x_i >= -8*pi, x_i <= 8*pi, 
%         x_i != 0, i \in N.
% Wyjście:
%  y  -   y ma być wektorem o takim samym ułożeniu(piom, poziom) i 
%         rozmiarze, jak wektor x, a każdy element y_i wektora y ma 
%         być w (możliwie najlepszym przybliżeniu) równy 
%         y_i = (sin(x_i) - x_i)*x^(-3)

% Wektory logiczne sprawdzające czy dany argument jest bliski wartości 0
logic_taylor = abs(x)<0.2;
logic_real = ~logic_taylor;

% Wyznaczanie wartości wyrażenia dla wektora wartości wyrazenia
% (sin(x_i) - x_i)*x^(-3) przedstawionego w postaci szerega Taylora
% korzystając z mnożenia wielomianów według shematu Hornera dla szybkości 
% oraz obliczanie zwykłego wyrażenia
% taylor_y = - 1/6 + x.*x/120 - (x.^4)/5040 + (x.^6)/362880 - ...
% (x.^8)/39916800;
[taylor_y,real_y ] = xsin3TaylorReal(x);

% Wybór odpowiedniej metody obliczania wartości wyrażenia w zależności
% od odległośći argumenta od 0 względem postaci sumy iloczynów wektorów 
% wartości wyrażenia oraz odpowiadających im wektórów wartości argumentów
% względem wyrażeń
y = logic_taylor.*taylor_y + logic_real.*real_y;
end % function 

