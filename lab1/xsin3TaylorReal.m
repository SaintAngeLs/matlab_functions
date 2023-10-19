function [TH_y, R_y] = xsin3TaylorReal(x)
% Autor: Andrii Voznesenskyi, 323538
% xsin3TaylorReal(x) - wyznaczanie wartości wyrażenia dla wektora wartości
% wyrazenia (sin(x_i) - x_i)*x^(-3) przedstawionego w postaci szerega 
% Taylora korzystując ze schematu mnożenia wielomianów Hornera od środka
% oraz obliczenia wartości wyrażenia (sin(x_i) - x_i)*x^(-3) bez rozwinięć
% Wejście:
%   x      -  dowolny wektor o elementach rzeczywistych x_i (skalar 
%             traktuje się jago szczególny przypadek
%             wektora), którego rozmiar nie przekracza 25*10^6, oraz dla 
%             którego zachodzą warunki: x_i >= -8*pi, x_i <= 8*pi, 
%             x_i != 0, i \in N.
% Wyjście:
%   TH_y   -  wektor wartości wyrazenia (sin(x_i) - x_i)*x^(-3) uzyskanego
%             z rozwinięcia Taylora funkcji (sin(x_i) - x_i)*x^(-3) wokół
%             punkta x_0 = 0, uporządkowanego według shematu Hornera
%   R_y    -  wektor wartości wyrażenia (sin(x_i) - x_i)*x^(-3)

x2 = x .* x;
TH_y = (((((-1/39916800) .* x2 + 1/362880) .* x2 - 1/5040) .* x2 ...
        + 1/120) .* x2 - 1/6);
R_y = (sin(x) - x)./(x.*x.*x);
end

