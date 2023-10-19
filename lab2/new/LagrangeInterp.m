function L = LagrangeInterp(X, Y, x)
% Pomocnicza funkcja obliczająca interpolację Lagrange'a dla danego 
% zestawu punktów.
% Parametry wejściowe:
% X - wektor wartości x punktów
% Y - wektor wartości y punktów
% x - punkt, w którym chcemy obliczyć wartość interpolacji
% Parametr wyjściowy:
% L - wartość interpolacji w punkcie x
% Autor: Andrii Voznesenskyi,

% Obliczamy długość wektora X
n = length(X);
L = 0;
% Dla każdego indeksu i, j od 1 do n
for i = 1:n
    p = 1;
    for j = 1:n
        % Jeżeli indeks i nie jest równy indeksowi j
        if i ~= j
            % Obliczamy wartość p na podstawie formuły interpolacji 
            % Lagrange'a
            p = p*(x - X(j))/(X(i) - X(j));
        end
    end
    % Dodajemy do L wartość p pomnożoną przez odpowiednią wartość Y
    L = L + p*Y(i);
end
end % function