
intial_points = [[2, 2]; [-2, -2]];
step_sizes = [0.1, 0.05, 0.01];
results = GD(intial_points, step_sizes, 1e-6, 1000);


results_table = array2table(results, 'VariableNames', {'Initial_X1', 'Initial_X2', 'Step_Size', 'Final_X1', 'Final_X2', 'Iterations'});
disp(results_table);