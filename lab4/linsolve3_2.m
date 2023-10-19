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

% określmy rozmiar wektora r z treści zadania
n = length(r);

 % Tworzenie pełnej macierzy z wektorów a, b, c
    A = zeros(n, n);
    A(1, 1) = b(1);
    for i = 2:n
        A(i, i-1) = a(i-1);
        A(i, i) = b(i);
    end
    for i = 1:n-1
        A(i, i+1) = c(i);
    end

    % Dodanie r do A dla ułatwienia obliczeń
    A = [A, r];
    
    % Eliminacja Gaussa z częściowym wyborem elementu głównego
    for i = 1:n-1
        % Wybór wiersza z maksymalnym elementem w kolumnie
        [~, idx] = max(abs(A(i:n, i)));
        idx = idx + i - 1; % Przesunięcie indeksu
        
        % Zamiana wierszy
        if idx ~= i
            temp = A(i,:);
            A(i,:) = A(idx,:);
            A(idx,:) = temp;
        end
        
        % Dalsza eliminacja
        for j = i+1:n
            factor = A(j, i) / A(i, i);
            A(j, i:n+1) = A(j, i:n+1) - factor * A(i, i:n+1);
        end
    end
    
    % Wsteczne podstawienie
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (A(i, n+1) - A(i, 1:n) * x) / A(i, i);
    end

end % function

