function [b,r] = forward_elimination(a, b, c, r, n)
% forward_elimination(a, b, c, r, n) - funkcja wykonująca eliminację wprost
% Wejście:
%   a  - wektor rozmiaru n-1, reprezentujący elementy dolnej diagonali 
%        macierzy A
%   b  - wektor rozmiaru n, reprezentujący elementy głównej diagonali 
%        macierzy A
%   c  - wektor rozmiaru n-1, reprezentujący elementy górnej diagonali 
%        macierzy A
%   r  - wektor rozmiaru n, reprezentujący stronę prawą równań
%   n  - rozmiar wektorów
% Wyjścia:
%   b  - zaktualizowany wektor b po eliminacji wprost
%   r  - zaktualizowany wektor r po eliminacji wprost
% Autor: Andrii Voznesenskyi

for i = 2:n
    
    w = a(i-1)/b(i-1);
    b(i) = b(i)-w*c(i-1);
    r(i) = r(i)-w*r(i-1);
end

end % function

