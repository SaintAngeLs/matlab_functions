function test_cncint2()
    % Definiujemy kilka funkcji do testowania
    f1 = @(x) x.^2; % Całka z x^2 na przedziale [0, 1] to 1/3.
    f2 = @(x) sin(x); % Całka z sin(x) na przedziale [0, pi] to 2.
    f3 = @(x) exp(x); % Całka z exp(x) na przedziale [0, 1] to e - 1.

    % Określamy liczby węzłów i podprzedziałów do testowania
    ns = [2, 3, 4, 5, 6, 7];
    Ms = [10, 100, 1000, 10000];

    % Testujemy dla różnych wartości n i M
    for n = ns
        for M = Ms
            Q = cncint(f1, 0, 1, n, M);
            fprintf('f1: n = %d, M = %d, Q = %.10f, Error = %.10f\n', n, M, Q, abs(Q - 1/3));
            Q = cncint(f2, 0, pi, n, M);
            fprintf('f2: n = %d, M = %d, Q = %.10f, Error = %.10f\n', n, M, Q, abs(Q - 2));
            Q = cncint(f3, 0, 1, n, M);
            fprintf('f3: n = %d, M = %d, Q = %.10f, Error = %.10f\n', n, M, Q, abs(Q - (exp(1) - 1)));
        end
    end

    % Prosty test sprawdzający obsługę wektorów/macierzy
    f4 = @(x) ones(size(x));
    try
        Q = cncint(f4, 0, 1, 2, 10);
        fprintf('==============================================\n');
        fprintf('Test wektorowy/macierzowy zakończony sukcesem.\n');
        fprintf('==============================================\n');
    catch
        fprintf('==============================================\n');
        fprintf('Test wektorowy/macierzowy zakończony błędem.\n');
        fprintf('==============================================\n');
    end
end
