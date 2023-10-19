% Define a set of test functions and corresponding initial guess points
test_funcs = {
    @(x) x^3 - 2*x^2 + x - 1; % cubic polynomial
    @(x) exp(x); % exponential
    @(x) log(x); % logarithmic
    @(x) tan(x); % tangential (periodic)
    @(x) 1/(x-2); % rational function with singularity
    @(x) sqrt(x); % square root function
};

initial_guesses = [
    0.5, 1, 1.5; % for cubic polynomial
    -100,-99, -98; % for exponential
    0.5, 1, 1.5; % for logarithmic, note the domain
    0, pi/4, pi/2; % for tangential
    1, 1.5, 1.9; % for rational function, watch out for the singularity at x=2
    -1, -1/1000, 1; % for square root function, note the domain
];

K = 100;

% Run tests
for i = 1:size(test_funcs, 1)
    fprintf('Testing function %d:\n', i);
    
    x0 = initial_guesses(i, 1);
    x1 = initial_guesses(i, 2);
    x2 = initial_guesses(i, 3);
    
    [a, p] = ii2root(test_funcs{i}, x0, x1, x2, K);
    if isempty(a)
        fprintf('The function did not find a root.\n\n');
        continue;
    end
    fprintf('Root a = %.8f found after %d iterations\n', a, p);
    
    % Check if the root is indeed a root
    assert(abs(test_funcs{i}(a)) <= 8*max(abs([test_funcs{i}(x0), test_funcs{i}(x1), test_funcs{i}(x2)]))*eps, ...
           'The computed root does not satisfy the function to within the tolerance.');
    
    % Check if the root is real
    assert(isreal(a), 'The computed root is not real.');

    % Check if the root is finite
    assert(isfinite(a), 'The computed root is not finite.');

    fprintf('All tests passed for function %d.\n\n', i);
end