function x = backward_elimination(x, r, c, b, n)
% backward_elimination(x, r, c, b, n) - funkcja wykonująca eliminację 
% odwrotną
% Wejście:
%   x  - wektor zawierający tymczasowe rozwiązania
%   r  - wektor rozmiaru n, reprezentujący stronę prawą równań
%   c  - wektor rozmiaru n-1, reprezentujący elementy górnej diagonali 
%        macierzy A
%   b  - wektor rozmiaru n, reprezentujący elementy głównej diagonali 
%        macierzy A
%   n  - rozmiar wektorów
% Wyjście:
%   x  - wektor zawierający ostateczne rozwiązania układu równań
% Autor: Andrii Voznesenskyi

for i = (n-1):(-1):1
    x(i) = (r(i)-c(i)*x(i+1))/b(i);
end

end % function

