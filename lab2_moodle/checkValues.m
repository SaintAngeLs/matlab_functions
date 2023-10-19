function valid = checkValues(y)
% Sprawdź, czy wszystkie elementy y są rzeczywiste, skończone i unikalne
% Wejście:
% y - wektor wartości do sprawdzenia
% Wyjście:
% valid - wartość logiczna wskazująca, czy wszystkie elementy y są 
% rzeczywiste, skończone i parami różne
% Autor: Andrii Voznesenskyi

% Czy wszystkie elementy y są rzeczywiste
realCheck = all(isreal(y));
% Czy wszystkie elementy y są skończone
finiteCheck = all(isfinite(y));
% Czy wszystkie elementy y są unikalne
uniqueCheck = numel(unique(y)) == numel(y) && all(y~=0);
% Czy wszystkie sprawdzenia przeszły pomyślnie
valid = (realCheck && finiteCheck && uniqueCheck);
end % function
