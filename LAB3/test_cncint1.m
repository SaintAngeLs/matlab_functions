function test_cncint1()
    % Definiujemy kilka funkcji do testowania
    f1 = @(x) x.^2; % Całka z x^2 na przedziale [0, 1] to 1/3.
    f2 = @(x) sin(x); % Całka z sin(x) na przedziale [0, pi] to 2.
    f3 = @(x) exp(x); % Całka z exp(x) na przedziale [0, 1] to e - 1.

    % Określamy liczby węzłów i podprzedziałów do testowania
    ns = [2, 3, 4, 5, 6, 7];
    Ms = [10, 100, 1000, 10000];

    % Testujemy f1
    fprintf('Testujemy f1\n');
    for n = ns
        for M = Ms
            Q = cncint(f1, 0, 1, n, M);
            fprintf('n = %d, M = %d, Q = %.10f, Error = %.10f\n', n, M, Q, abs(Q - 1/3));
        end
    end

    % Testujemy f2
    fprintf('Testujemy f2\n');
    for n = ns
        for M = Ms
            Q = cncint(f2, 0, pi, n, M);
            fprintf('n = %d, M = %d, Q = %.10f, Error = %.10f\n', n, M, Q, abs(Q - 2));
        end
    end

    % Testujemy f3
    fprintf('Testujemy f3\n');
    for n = ns
        for M = Ms
            Q = cncint(f3, 0, 1, n, M);
            fprintf('n = %d, M = %d, Q = %.10f, Error = %.10f\n', n, M, Q, abs(Q - (exp(1) - 1)));
        end
    end
end

