function [a, p] = ii2root(f, x0, x1, x2, K)
% Interpolacja odwrotna w zagadnieniu wyznaczania miesca zerowego
% funkcji. Załóżmy, że mamy daną rzeczywistą funkcję f, której rzeczywiste
% miejsce zorowe "a" chcemy wyznaczyć. Niech punkty x_0, x_1, x_2 będą 
% takimi przybliżeniami szukanego miejsca zerowego, w pewnym przedziale
% zawierającym x_0, x_1, x_2 i a funkcja f jest różnowartościwa. Wtedy  w
% przedziale istnieje funkcja odwrotna f, g = f^(-1). Oznacza to, że jeśli
% a jest miescem zerowym funkcji f, czyli f(a) == 0, to a = g(0). Pomysł
% przybliżenia wartości a wygląda następującj: obliczamy y_0 = f(x_0), y_1
% = f(x_1) oraz y_2 = f(x_2), a następnie wyznaczamy wielomian
% interpolacyjnu Lagrange'a drugiego stopnia w dla funkcji g, spałniający
% warunki interpolacji w(y_k) = g(y_k) = x_k dla k = 0, 1, 2. Za
% przybliżenie miejsca zorowego a przyjmiemy wartość w(0). Konkretną postać
% wielomianu interpolacujnego należy wybrać samemu. Oczywiści w(0), może
% jescze nie być (i zwykle nie jest ) odpowiednio dobrym
% przybliżeniem szykanego miejsca zerowego. Możemy jednak przypisać x_0 <-
% x_1, x_1<-x_2, x_2<-w(0) i drugi raz wykonać powyższą procedure, a potem
% trzeci raz, czwarty i tak dalej. Każde wykonanie powyższej procedury
% nazywa się krokiem. W praktyce powyższy schemat da się wykonac tylko, gdy
% wartości y_0, y_1, y_2 są parami różne, oraz że y_0, y_1, y_2  śą
% skączone i rzeczywiste(warto sprawdzić isreal i isfinite). W programie
% realizującym to zadanie, opisaną powyżsżej procedurę należy wykonać
% maksymalnie K raz (K >= 1) lub do momentu, gdy ktoryś z powyższych trzech
% warunków na y_0, y_1 i y_2 nie będzie spełniony. Uwaga: niespełnienie w
% praktyce pierwszego z trzech warunków zwykle nie oznacza porażki, tylko
% to, że dokładniej miejsca zerowego przybliżyć w danej arytmetyce się nie
% da. Na zakąńczenie ocenić, czy ostatnie wyznaczone przybliżenie a w
% przybliżeniu jest równe w(0) jest akceptowalne - zgodne  z warunkami
% podanymi powyżej.
% [a,p] = ii2root(f, x0, x1, x2, K), gdzie f jest wskażnikiem do funkcji,
% której miejsca zerowego poszukujemy, a liczby  x0, x1 i x2 są
% opisanymi wyżej przybliżeniami standardowymi. Znaczenie paramteru K
% wyjaśniene jest wyżej , 1<=K<=100. argument wyjściowy p ma być równy
% liczbie faktycznie wykonanych kroków metody opisanej powyżej(zakładamy 
% że jeden krok metody zawsze się wykona). Wartośc a ma być równa
% ostatniemu przybliżeniu miejsca zerowego funkcji f. jeśli |f(a)| <=
% 8*M*eps, lub ma być macierą pustą (a = []), w przeciwnym wypadku. Wartośc
% M = max{|f(x_0)|, |f(x_1)|, |f(x_2)|}, gdzie x_0, x_1, x_2 są
% przybliżeniami startowymi, czyli argumentami x_0, x_1, x_2. Używać tylko
% podstawowej wersji matlaba.
% Główna funkcja realizująca metodę interpolacji odwrotnej w celu 
% znalezienia pierwiastka funkcji f.
% Parametry wejściowe:
% f - wskaźnik do funkcji, której miejsce zerowe szukamy
% x0, x1, x2 - początkowe przybliżenia miejsca zerowego
% K - maksymalna liczba iteracji
% Parametry wyjściowe:
% a - ostatnie przybliżenie miejsca zerowego funkcji f
% p - liczba faktycznie wykonanych kroków metody
% Autor: Andrii Voznesenskyi

% Startujemy z początkowymi przybliżeniami
x = [x0, x1, x2];
% problemhandler do uchwytów postaci wektorowych z 1./x i 1/x
y = f(x);

% Obliczamy M
M = max(abs(y));

% Inicjalizujemy a
a = [];
w0 = LagrangeInterp(y, x, 0);
%w0 = LagrangeInterp(y, x, 0);
% Rozpoczynamy iteracje
for p = 1:K
    if checkValues(y)
        % Obliczamy w(0) za pomocą interpolacji Lagrange'a
        w0 = LagrangeInterp(y, x, 0);
        % Aktualizujemy przybliżenia
        x = [x(2), x(3), w0];
        y = f(x);
    else
        break;
    end
end
% Sprawdzenie tolerancji
if check_tolerance(f, w0, M)
    a = w0;
end
end % function
