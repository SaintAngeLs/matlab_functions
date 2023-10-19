function tol = check_tolerance(f, a, M)
% Sprawdza, czy obliczone przybliżenie spełnia warunek tolerancji
% Autor: Andrii Voznesenskyi

tol = abs(f(a)) <= 8*M*eps;
end