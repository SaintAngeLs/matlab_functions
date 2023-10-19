function test_cncint4()
    % Testujemy trzy różne funkcje
    f1 = @(x) x.^2;
    f2 = @(x) sin(x);
    f3 = @(x) exp(x);

    % Prawdziwe wartości całek dla tych funkcji na danym przedziale
    trueIntegral_f1 = 1/3; % integral from 0 to 1 of x^2 dx
    trueIntegral_f2 = 2;   % integral from 0 to pi of sin(x) dx
    trueIntegral_f3 = exp(1) - 1; % integral from 0 to 1 of e^x dx

    % Określamy liczby węzłów do testowania
    ns = [2, 3, 4, 5, 6, 7];
    % Wybieramy dużą wartość M
    M = 50*10^5;

    % Testujemy dla różnych wartości n
    for n = ns
        fprintf('Test for n = %d, M = %d\n', n, M);

        try
            fprintf('Testing f1...\n');
            tic;
            Q = cncint(f1, 0, 1, n, M);
            elapsedTime = toc;
            fprintf('Computed integral Q = %.16f\n', Q);
            fprintf('True integral = %.16f\n', trueIntegral_f1);
            fprintf('Error = %.16f\n', abs(Q - trueIntegral_f1));
            fprintf('Elapsed time for f1 = %.6f seconds\n', elapsedTime);
        catch ME
            fprintf('An error occurred while testing f1: %s\n', ME.message);
        end

        try
            fprintf('Testing f2...\n');
            tic;
            Q = cncint(f2, 0, pi, n, M);
            elapsedTime = toc;
            fprintf('Computed integral Q = %.16f\n', Q);
            fprintf('True integral = %.16f\n', trueIntegral_f2);
            fprintf('Error = %.16f\n', abs(Q - trueIntegral_f2));
            fprintf('Elapsed time for f2 = %.6f seconds\n', elapsedTime);
        catch ME
            fprintf('An error occurred while testing f2: %s\n', ME.message);
        end

        try
            fprintf('Testing f3...\n');
            tic;
            Q = cncint(f3, 0, 1, n, M);
            elapsedTime = toc;
            fprintf('Computed integral Q = %.16f\n', Q);
            fprintf('True integral = %.16f\n', trueIntegral_f3);
            fprintf('Error = %.16f\n', abs(Q - trueIntegral_f3));
            fprintf('Elapsed time for f3 = %.6f seconds\n', elapsedTime);
        catch ME
            fprintf('An error occurred while testing f3: %s\n', ME.message);
        end
    end
    fprintf('==============================================\n');
    fprintf('Wszystkie testy zakończone.\n');
    fprintf('==============================================\n');
end
