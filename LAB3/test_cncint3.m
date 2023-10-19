function test_cncint3()
    % Testujemy trzy różne funkcje, które przyjmują wektory/macierze jako argumenty
    f1 = @(x) ones(size(x));
    f2 = @(x) x.*0 + 3.14;
    f3 = @(x) x.^0;

    % Określamy liczby węzłów i podprzedziałów do testowania
    ns = [2, 3, 4, 5, 6, 7];
    Ms = [10, 100, 1000, 10000];

    % Testujemy dla różnych wartości n i M
    for n = ns
        for M = Ms
            try
                Q = cncint(f1, 0, 1, n, M);
                fprintf('Test f1: n = %d, M = %d, Q = %.10f\n', n, M, Q);
                Q = cncint(f2, 0, pi, n, M);
                fprintf('Test f2: n = %d, M = %d, Q = %.10f\n', n, M, Q);
                Q = cncint(f3, 0, 1, n, M);
                fprintf('Test f3: n = %d, M = %d, Q = %.10f\n', n, M, Q);
            catch
                fprintf('==============================================\n');
                fprintf('Błąd podczas przetwarzania funkcji akceptujących wektory/macierze.\n');
                fprintf('Niepowodzenie dla n = %d, M = %d\n', n, M);
                fprintf('==============================================\n');
                return;
            end
        end
    end
    fprintf('==============================================\n');
    fprintf('Wszystkie testy zakończone pomyślnie.\n');
    fprintf('==============================================\n');
end
