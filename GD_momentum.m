function results = GD_momentum(initial_points, step_sizes, alpha_values, tol, max_iter)

    
    syms x1 x2
    f_sym = x1^4 - 4*x1*x2 + x2^4;
    grad_f_sym = gradient(f_sym, [x1, x2]);

    
    f = matlabFunction(f_sym);
    grad_f = matlabFunction(grad_f_sym);

   
    [X1, X2] = meshgrid(-2:0.05:2, -2:0.05:2);
    F = f(X1, X2);

    
    results = [];

   
    for a = 1:length(alpha_values)
        
        
        figure;

       
        for i = 1:size(initial_points, 1)

            
            for j = 1:length(step_sizes)
                
                
                subplot(length(step_sizes), size(initial_points, 1), (i - 1) * length(step_sizes) + j);
                surf(X1, X2, F);
                hold on;
                title(sprintf('Point: [%f, %f], Step: %f', initial_points(i,1), initial_points(i,2), step_sizes(j)))

                
                x = initial_points(i, :);
                v = [0, 0];  

                for k = 1:max_iter

                    
                    g = grad_f(x(1), x(2));

                   
                    if norm(g) < tol
                        break
                    end

                   
                    v = alpha_values(a) * v + step_sizes(j) * g;
                    x = x - v;
                end

                
                plot3(x(1), x(2), f(x(1), x(2)), 'r.', 'MarkerSize', 20);

                
                results = [results; initial_points(i, :) step_sizes(j) alpha_values(a) x(1) x(2) k];
                
                hold off;
            end
        end
        
        
        sgtitle(sprintf('Alpha: %f', alpha_values(a)))
    end
end
