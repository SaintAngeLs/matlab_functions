function tol = check_tolerance(f, w0, M)
% Sprawdza, czy obliczone przybliżenie spełnia warunek tolerancji
% Autor: Andrii Voznesenskyi

tol = abs(f(w0)) <= 8*M*eps;
end