initial_points = [[2, 2]; [-2, -2]];
step_sizes = [0.1, 0.05, 0.01];
alpha_values = [0.05, 0.1, 0.15];

results = GD_momentum(initial_points, step_sizes, alpha_values, 1e-6, 1000);

T = array2table(results, 'VariableNames', {'Initial_X1', 'Initial_X2', 'Step_Size', 'Alpha', 'Final_X1', 'Final_X2', 'Iterations'});
disp(T);
