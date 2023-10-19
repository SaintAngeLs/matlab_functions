function [x] = linsolve3(a, b, c, r)
% Macierz drójdiagonalna A o elemntach a_{i,j} to taka macierz, dla której
% spełniony będzie warunek a_{ij} = 0, gdt |i - j| > 0. Nie musie to
% oznaczać, że a_{ij} != 0dla każdych |i - j| <= 1. W praktyce elementy
% takiej macierzy są przechporywane w trzech wektorzch albo w tablicy  o
% rozmiarze 3 x n (lub n x 3). Macierz A jest pamiętana w wektorach a, b, c
% o rozmiarach odpowiednio n-1, n i n-1 rozmieszczonych w postaci 
% następującej:
%     [b_1   c_1                      ]
%     [a_1   b_2                      ]
% A = [                               ]
%     [                        c_{n-1}]
%     [              a_{n-1}   b_n    ]
% linsolve3(a, b, c, r) - funkjca rozwiązująca (z dobrą dokładnością) układ
% równań liniowych Ax=r (*), gdzie A - macierz trójdiagonalna, opisana
% wektorami a, b, c w sposób reprezentowany powyżej, przy czym można
% zakładać że 1 <= n <= 5*10^6. Wszyskie wektory są pionowe.
% Wejście:
%   a  -  wektor rozmiaru n-1, opisany dokładniej powyżej
%   b  -  wektor rozmiaru n, opisany dokładniej powyżej
%   c  -  wektor rozmiaru n-1, opisany dokładniej powyżej
%   r  -  wektor rozmiaru n, znajdującej się po prawej stronie równania (*) 
% Wyjście:
%   x  -  wektor wartości rozwiązań układu równań liniowych (*)
% Autor: Andrii Voznesenskyi

% Inicializacja
[a, b, c, n, g, x] = initialization(a, b, c, r);

% Eliminacja
[~, b, c, g, r] = elimination(a, b, c, g, r, n);

% Back substitution
x = backSubstitution(r, b, c, g, n, x);

end % function

