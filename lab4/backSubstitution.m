function x =  backSubstitution(r, b, c, g, n, x)
% Wykonuje wsteczną substitucję w celu znalezienia rozwiązania układu 
% równań
% Parametry wejściowe:
%   r, b, c, g: Wektory danych wejściowych
%   n: Liczba równań
%   x: Wektor zerowy o długości n
% Parametry wyjściowe:
%   x: Zaktualizowany wektor x zawierający rozwiązanie układu równań

% Autor: Andrii Voznesenskyi
    
x(n)=r(n)/b(n);
x(n-1)=(r(n-1)-c(n-1)*x(n))/b(n-1);
for i=n-2:-1:1
    x(i)=(r(i)-c(i)*x(i+1)-g(i)*x(i+2))/b(i);
end
end % function