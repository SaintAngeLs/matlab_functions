function [a, b, c, g, r] = elimination(a, b, c, g, r, n)
% Funkcja wykonuje eliminację Gaussa w celu rozwiązania układu równań 
% liniowych
% Parametry wejściowe:
%   a, b, c, g, r: Wektory danych wejściowych
%   n: Liczba równań
% Parametry wyjściowe:
%   a, b, c, g, r: Zaktualizowane wektory danych wejściowych po eliminacji

% Autor: Andrii Voznesenskyi

for i=1:n-1
    % Pivoting
    if abs(b(i)) < abs(a(i+1))
        [b(i),a(i+1)] = swap(b(i),a(i+1));
        [b(i+1),c(i)] = swap(b(i+1),c(i));
        [g(i),c(i+1)] = swap(g(i),c(i+1));
        [r(i),r(i+1)] = swap(r(i),r(i+1));
    end
    
    m=a(i+1)/b(i); %A(j,i)/A(i,i);
    a(i+1)=a(i+1)-m*b(i); %A(j,i+1:n+1)=A(j,i+1:n+1)-m*A(i,i+1:n+1);   
    b(i+1)=b(i+1)-m*c(i);
    c(i+1)=c(i+1)-m*g(i);
    r(i+1)=r(i+1)-m*r(i);
end
end % function