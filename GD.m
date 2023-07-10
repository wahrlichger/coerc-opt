function results = GD(intial_points, step_sizes, tol, max_iter)

    
    syms x1 x2
    f_sym = x1^4 - 4*x1*x2 + x2^4;
    grad_f_sym = gradient(f_sym, [x1, x2]);

    
    f = matlabFunction(f_sym);
    grad_f = matlabFunction(grad_f_sym);

   
    [X1, X2] = meshgrid(-2:0.05:2, -2:0.05:2);
    F = f(X1, X2);

    
    results = [];

   
    for i = 1:size(intial_points, 1)
        figure;  
        
        sgtitle(sprintf('Initial Point: [%f, %f]', intial_points(i,1), intial_points(i,2)));  

        
        for j = 1:length(step_sizes)
            
            subplot(1, length(step_sizes), j); 
            surf(X1, X2, F, 'EdgeColor', 'none', 'FaceAlpha', 0.7);  
            hold on;
            title(sprintf('Step size: %f', step_sizes(j)))
            xlabel('X1');
            ylabel('X2');
            zlabel('F(X1, X2)');
            view(-30, 45);  
            
            fprintf('\nStarting point: [%f, %f], Step size: %f\n', intial_points(i,1), intial_points(i,2), step_sizes(j))

            % Initialization
            x = intial_points(i, :);

            for k = 1:max_iter

                fprintf('Iteration %d: x = [%f, %f], f(x) = %f\n', k, x(1), x(2), f(x(1), x(2)))

                g = grad_f(x(1), x(2));

                if norm(g) < tol
                    break
                end

                plot3(x(1), x(2), f(x(1), x(2)), 'r.', 'MarkerSize', 10);

                x = x - step_sizes(j) * g;
            end

            fprintf('Candidate extreme point: x = [%f, %f]\n', x(1), x(2))

            
            results = [results; intial_points(i, :) step_sizes(j) x(1) x(2) k];

            hold off;
        end
    end
end
