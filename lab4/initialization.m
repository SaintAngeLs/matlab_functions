function [a, b, c, n, g, x] = initialization(a, b, c, r)
% Inicjalizuje wektory i zmienne pomocnicze dla rozwiązania układu równań
% Parametry wejściowe:
%   a, b, c, r: Wektory danych wejściowych
% Parametry wyjściowe:
%   a, b, c: Zaktualizowane wektory danych wejściowych
%   n: Liczba równań
%   g: Wektor zerowy o długości n
%   x: Wektor zerowy o długości n
% Autor: Andrii Voznesenskyi

c=[c(:);0]; 
a=[0;a(:)]; 
b=b(:);
n=length(r);
x=zeros(size(r));
g=zeros(1,n);
end % function