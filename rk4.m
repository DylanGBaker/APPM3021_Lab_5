function [x,y] = rk4(f,x0,y0,N,xf)
y_initial = y0;
x_initial = x0;
x_final = xf;
number_of_sub_intervals = 0;
h = (x_final - x_initial)/N;
matrix_index = 1;

while x_initial <= xf + h
    x(matrix_index,1) = x_initial;
    y(matrix_index,1) = y_initial;

    %Get k values using the equations of a 4th order Runge-Kutta
    k_one = h * f(x_initial, y_initial);
    k_two = h * f(x_initial + h/2, y_initial + k_one/2);
    k_three = h * f(x_initial + h/2, y_initial + k_two/2);
    k_four = h * f(x_initial + h, y_initial + k_three);

    %%%%%%%%%%%

    y_initial_plus_one = y_initial + (1/6) * (k_one + (2 * k_two) + (2 * k_three) + k_four);
    x_initial = x_initial + h;
    y_initial = y_initial_plus_one;
    matrix_index = matrix_index + 1;
end
end