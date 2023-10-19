function Q = ncnorder(f,x,h,n)
% ncnorder(func, a, b, N) - zwraca przybliżoną wartość całki obliczonej ze
% wzoru Newtona_Cotesa rzędu N funkcji ciągłej func na przedziale [a,b];
% Autor: Andrii Voznesenskyi;

% wartości współczynników kwadratury
w = nkkwcoefvals(n);  

% Wartości f dla wszystkich węzłów
F = f(x);

% Zasumowana warsość kwadratury dla każdego podprzedziału
Q = h * sum(w * F, 1);

% Suma wartości kwadratur dla wszystkich podprzedziałów
Q = sum(Q);
end % function