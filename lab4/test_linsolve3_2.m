function test_linsolve3_2()
    num_tests = 1000;  
    n = 5000000;          
    errors = zeros(num_tests, 1);  
    
    
    for i = 1:num_tests
        

        a = rand(n-1, 1); 
        b = rand(n, 1);    
        c = rand(n-1, 1);  
        r = ones(n, 1);    

        
        A = spdiags([ [a; 0] b [0; c] ], -1:1, n, n);
        x_true = A \ r;
        tic;  
        % Solve the linsolve3
        x = linsolve3(a, b, c, r);
        elapsedTime = toc;  
        
        errors(i) = norm(x - x_true) / norm(x_true);

        

        fprintf('TEST %d. error = %e; Elapsed time = %f seconds\n', i, errors(i), elapsedTime);
    end
    
    % Calculate and display some statistics about the errors
    fprintf('Average relative error: %e\n', mean(errors));
    fprintf('Maximum relative error: %e\n', max(errors));
    fprintf('Minimum relative error: %e\n', min(errors));
end
