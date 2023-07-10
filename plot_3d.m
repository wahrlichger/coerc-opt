[x1, x2] = meshgrid(-2:0.01:2, -2:0.01:2);
f = x1.^4 - 4.*x1.*x2 + x2.^4;
figure
surf(x1, x2, f, 'EdgeColor', 'none', 'FaceLighting', 'gouraud') 
colormap jet 
colorbar 
title('3D plot of f(x_1,x_2) = x_1^4 - 4x_1x_2 + x_2^4', 'FontSize', 14)
xlabel('x_1', 'FontSize', 12)
ylabel('x_2', 'FontSize', 12)
zlabel('f(x_1,x_2)', 'FontSize', 12)
grid on 
 
