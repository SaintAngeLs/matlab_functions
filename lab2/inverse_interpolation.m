function a = interpolation(x0, x1, x2, y0, y1, y2, a)
% Wykonuje interpolację Lagrange'a, obliczając wartość w punkcie 'a'
% dla punktów (x0, y0), (x1, y1), (x2, y2)
% Autor: Andrii Voznesenskyi

% Wielomian interpolacyjny Lagrange'a
L0 = ((a - x1) * (a - x2)) / ((x0 - x1) * (x0 - x2));
L1 = ((a - x0) * (a - x2)) / ((x1 - x0) * (x1 - x2));
L2 = ((a - x0) * (a - x1)) / ((x2 - x0) * (x2 - x1));

% Obliczanie wartości w punkcie 'a' za pomocą interpolacji Lagrange'a
a = L0 * y0 + L1 * y1 + L2 * y2;

end