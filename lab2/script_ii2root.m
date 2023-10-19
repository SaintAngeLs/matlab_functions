function [a, p] = ii2root(f, x0, x1, x2, K)

% Start with initial approximations
x = [x0, x1, x2];
y = f(x);

% Calculate M
M = max(abs(y));

% Initialize a
a = [];

% Start iterations
for p = 1:K
    if all(isreal(y)) && all(isfinite(y)) && numel(unique(y)) == numel(y)
        
        % Calculate w(0) using Lagrange interpolation
        w0 = LagrangeInterp(y, x, 0);
        
        % Update approximations
        x = [x(2), x(3), w0];
        y = f(x);
        
        % If tolerance condition is met, break the loop
        if abs(f(w0)) <= 8*M*eps
            a = w0;
            break;
        end
    else
        break;
    end
end
end

function L = LagrangeInterp(X, Y, x)
% Helper function to calculate the Lagrange interpolation
n = length(X);
L = 0;
for i = 1:n
    p = 1;
    for j = 1:n
        if i ~= j
            p = p*(x - X(j))/(X(i) - X(j));
        end
    end
    L = L + p*Y(i);
end
end


[a, p] = ii2root(@(x)1/x, 1, 2, 3, 100)