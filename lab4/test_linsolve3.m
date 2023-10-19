function test_linsolve3()

    % Random tridiagonal matrix
    disp("Random Tridiagonal Matrix:");
    n = 5; % Size of the matrix
    a = rand(n-1, 1); % Lower diagonal elements
    b = rand(n, 1); % Main diagonal elements
    c = rand(n-1, 1); % Upper diagonal elements
    r = rand(n, 1); % Right-hand side

    % Display the matrix
    A = diag(b) + diag(a, -1) + diag(c, 1);
    disp(A);

    % Calculate the true solution
    x_true = A \ r;

    % Solve the linear system using linsolve3
    x = linsolve3(a, b, c, r);
    disp(x);

    % Calculate the relative error
    relative_error = norm(x - x_true) / norm(x_true);
    fprintf('Relative error: %e\n\n', relative_error);

    %-----------------------------------------------

    % Large tridiagonal matrix
    disp("Large Tridiagonal Matrix:");
    n = 1000; % Size of the matrix
    a = rand(n-1, 1); % Lower diagonal elements
    b = rand(n, 1); % Main diagonal elements
    c = rand(n-1, 1); % Upper diagonal elements
    r = rand(n, 1); % Right-hand side

    % Calculate the true solution
    A = diag(b) + diag(a, -1) + diag(c, 1);
    x_true = A \ r;

    % Solve the linear system using linsolve3
    x = linsolve3(a, b, c, r);
    x_2 = linsolve3_2(a, b, c, r);

    % Calculate the relative error
    relative_error = norm(x - x_true) / norm(x_true);
    fprintf('Relative error: %e\n\n', relative_error);
    fprintf('Relative error x2: %e\n\n', norm(x - x_2)/norm(x_2));

    %-----------------------------------------------

    % Ill-conditioned tridiagonal matrix

    disp("Ill-Conditioned Tridiagonal Matrix:");
    n = 5; % Size of the matrix
    a = [1; 1; 1; 1]; % Lower diagonal elements
    b = [1; 1e-3; 1e-6; 1e-9; 1e-9]; % Main diagonal elements
    c = [1e-9; 1e-6; 1e-3; 1]; % Upper diagonal elements
    r = rand(n, 1); % Right-hand side

    % Calculate the true solution
    A = diag(b) + diag(a, -1) + diag(c, 1);
    x_true = A \ r;

    % Solve the linear system using linsolve3
    x = linsolve3(a, b, c, r);
    x_2 = linsolve3_2(a, b, c, r);


    % Calculate the relative error
    relative_error = norm(x - x_true) / norm(x_true);
    fprintf('Relative error: %e\n\n', relative_error);
    fprintf('Relative error x2: %e\n\n', norm(x - x_2)/norm(x_2));


    b = 100*[0.0079; 0.17; 0.0019; 0.0222137; 0.0018; 0.0055];  % Main diagonal elements
    c = 100*[0.00015; 0.005; 0.0005; 0.0419; 0.0005];     % Upper diagonal elements
    a = 100*[0.23; 2.13; 0.07; 2.25; 0.17];     % Lower diagonal elements
    B = [ 17.2; 0.5; 44.3; 13; 0.7; 13.3];  % Right-hand side vector
    % Calculate the true solution
    A = diag(b) + diag(a, -1) + diag(c, 1);
    disp(A);
    x_true = A \ B;


    % Solve the linear system using linsolve3
    x = linsolve3(a, b, c, B);
    x_2 = linsolve3_2(a, b, c, B);
    disp(x);
    % Calculate the relative error
    relative_error = norm(x - x_true) / norm(x_true);
    fprintf('Relative error: %e\n\n', relative_error);
    fprintf('Relative error x2: %e\n\n', norm(x - x_2)/norm(x_2));

     % Large tridiagonal matrix 0 in diabonal
    disp("Large Tridiagonal Matrix:");
    n = 1000; % Size of the matrix
    a = rand(n-1, 1); % Lower diagonal elements
    b = rand(n, 1); % Main diagonal elements
    c = rand(n-1, 1); % Upper diagonal elements
    r = rand(n, 1); % Right-hand side

    % Calculate the true solution
    a(1) = 0;
    A = diag(b) + diag(a, -1) + diag(c, 1);
    
    x_true = A \ r;
    
    % Solve the linear system using linsolve3
    x = linsolve3(a, b, c, r);
    x_2 = linsolve3_2(a, b, c, r);

    % Calculate the relative error
    relative_error = norm(x - x_true) / norm(x_true);
    fprintf('Relative error: %e\n\n', relative_error);
    fprintf('Relative error x2: %e\n\n', norm(x - x_2)/norm(x_2));

%     n = 5000000; % zmniejszamy rozmiar do 1000 dla testów
%     a = zeros(n-1, 1);
%     b = ones(n, 1);
%     c = zeros(n-1, 1);
%     r = ones(n, 1);
%     A = diag(b) + diag(a, -1) + diag(c, 1);
%     disp(A);
%     x_true = A \ r;
% 
% 
%     % Solve the linear system using linsolve3
%     x = linsolve3(a, b, c, r);
%     x_2 = linsolve3_2(a, b, c, r);
%     disp(x);
%     % Calculate the relative error
%     relative_error = norm(x - x_true) / norm(x_true);
%     fprintf('Relative error: %e\n\n', relative_error);
%     fprintf('Relative error x2: %e\n\n', norm(x - x_2)/norm(x_2));

    a = [1; 2; 3];
    b = [0.0001; 0.0001; 0.0001; 0.0001];
    c = [4; 5; 6];
    r = [1; 1; 1; 1]; 
    A = diag(b) + diag(a, -1) + diag(c, 1);
    disp(A);
    x_true = A \ r;

    x = linsolve3(a, b, c, r);
    x_2 = linsolve3_2(a, b, c, r);
    disp(x);
    % Calculate the relative error
    relative_error = norm(x - x_true) / norm(x_true);
    fprintf('Relative error: %e\n\n', relative_error);
    fprintf('Relative error x2: %e\n\n', norm(x - x_2)/norm(x_2));


end
