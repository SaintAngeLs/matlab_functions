function test_ii2root()
    % Testing ii2root with cosine function
    cos_func = @cos;
    x0 = 1; x1 = 2; x2 = 3; K = 100; % these are example values
    [a_cos, p_cos] = ii2root(cos_func, x0, x1, x2, K);
    i = 1;
    fprintf('Test %d: Cosine test: root a = %.8f found after %d iterations\n', i, a_cos, p_cos);
    
    % Testing ii2root with sine function
    sin_func = @sin;
    x0 = -1; x1 = 1/10; x2 = 1; K = 100; % these are example values
    [a_sin, p_sin] = ii2root(sin_func, x0, x1, x2, K);
    i = i + 1;
    fprintf('Test %d: Sine test: root a = %.8f found after %d iterations\n', i, a_sin, p_sin);
    
    % test tith random initioal approximation:
    rng(12345); % set random seed for reproducibility
    
    % Test different trigonometric functions
    fprintf('\n Test with random initial approxiamtions: \n\n')
    funcs = {@sin, @cos, @tan};
    
    for i = 1:50
        % Select a function for this test
        func = funcs{mod(i-1, numel(funcs)) + 1};
    
        % Generate random initial values between -5 and 5
        x0 = -5 + 10*rand();
        x1 = -5 + 10*rand();
        x2 = -5 + 10*rand();
    
        % Set maximum number of iterations
        K = 100;
    
        % Run ii2root with these values and print the result
        [a, p] = ii2root(func, x0, x1, x2, K);
        fprintf('Test %d: %s, root a = %.8f found after %d iterations (x0 = %.2f, x1 = %.2f, x2 = %.2f)\n', i+2, func2str(func), a, p, x0, x1, x2);
    end
    
    % Test for function other that trigonometric:
    fprintf('\n Test for different functions: \n\n')
    i = 52;
    
    % Testing ii2root with exponential function
    exp_func = @exp;
    x0 = -110; x1 = -109; x2 = -108; K = 100;
    [a_exp, p_exp] = ii2root(exp_func, x0, x1, x2, K);
    i = i + 1;
    fprintf('Test %d: %s, Exponential test: root a = %.8f found after %d iterations\n', i, func2str(exp_func), a_exp, p_exp);
    
    % Testing ii2root with natural logarithm function
    log_func = @log;
    x0 = 1; x1 = 2; x2 = 3; K = 100;
    [a_log, p_log] = ii2root(log_func, x0, x1, x2, K);
    i = i + 1;
    fprintf('Test %d: %s, Natural logarithm test: root a = %.8f found after %d iterations\n', i, func2str(log_func), a_log, p_log);
    
    % Testing ii2root with polynomial function
    poly_func = @(x) -x.*x + 4;  % example polynomial: x^2 + 2
    x0 = -2001/1000; x1 = -2; x2 = 2010/1000; K = 100;
    [a_poly, p_poly] = ii2root(poly_func, x0, x1, x2, K);
    i = i + 1;
    fprintf('Test %d: %s, Polynomial test: root a = %.8f found after %d iterations\n', i, func2str(poly_func), a_poly, p_poly);
end % function