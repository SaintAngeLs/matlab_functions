function w = nkkwcoefvals(N)
% nkkwcoefvals(N) - zwraca wartości 
%  function w =  nkkwcoefvals(N) współczynniki(uporządkowane węzły)
%  n-punktowej kwadratury Newtona-Cotesa (w wektorze pozioimym)
% Wejście:
%  N - liczba węzłów
% Wyjście:
%  w - poziomy wektor wartości współczynników
% Autor: Andrii Voznesenskyi

if(N < 2) 
    error('N is supposed to be at least 2!')
% Metoda trapezów:
elseif(N == 2)
    w = [0.5 0.5]; 
% Simpson:
elseif(N == 3)
    w = [1 4 1]/6; 
% Simpson 3/8:
elseif(N == 4)
    w = [0.125 0.375 0.375 0.125];
elseif(N == 5)
    w = [7 32 12 32 7]/90;
elseif(N == 6)
    w = [19 75 50 50 75 19]/288;
elseif(N == 7)
    w = [41 216 27 272 27 216 41]/840;
else
    error('N is supposed to be no more than 7!');
end % function 