function [x0, x1, x2] = update_values(x1, x2, a)
% Aktualizuje wartości x0, x1, x2 dla następnej iteracji
% Autor: Andrii Voznesenskyi

x0 = x1; x1 = x2; x2 = a;
end