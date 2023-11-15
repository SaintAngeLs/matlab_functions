# Function evaluation of f(x) = (sin(x) - x)*x^(-3), f: R -> R
% xsin(x) - funkcja obliczania możliwie najbardziej dokładnej wartości 
% funkcji f(x) = (sin(x) - x)*x^(-3) dla niezerowych argumentów należących
% do przedziału [-8*pi, 8*pi], gdzie x jest dowolnym wektorem o elementach 
% rzeczywistych x_i (skalar traktuje się jago szczególny przypadek
% wektora), którego rozmiar nie przekracza 25*10^6, oraz dla którego
% zachodzą warunki: x_i >= -8*pi, x_i <= 8*pi, x_i != 0, i \in N.
% Wynik y ma być wektorem o takim samym ułożeniu(pion, poziom) i rozmiarze,
% jak wektor x, a każdy element y_i wektora y ma być w (możliwie
% najlepszym przybliżeniu) równy y_i = (sin(x_i) - x_i)*x^(-3)
