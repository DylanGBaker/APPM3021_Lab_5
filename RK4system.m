function [x,y]= RK4system (f, xspan, y0, N, K_one, K_two, K_three, K_four)
y_initial = y0;
x_initial = xspan(1);
x_final = xspan(2);
number_of_sub_intervals = 0;
h = (xspan(2) - xspan(1))/N;
matrix_row_index = 1;
matrix_column_index = 1;

while x_initial <= xf
    x(matrix_index,1) = x_initial;
    %y(matrix_index,1) = y_initial;

    %Get k values using the equations of a 4th order Runge-Kutta
    %k_one = h * f(x_initial, y_initial);
    %k_two = h * f(x_initial + h/2, y_initial + k_one/2);
    %k_three = h * f(x_initial + h/2, y_initial + k_two/2);
    %k_four = h * f(x_initial + h, y_initial + k_three);

    %%%%%%%%%%%

    %y_initial_plus_one = y_initial + (1/6) * (k_one + (2 * k_two) + (2 * k_three) + k_four);
    %x_initial = x_initial + h;
    %y_initial = y_initial_plus_one;
    %matrix_index = matrix_index + 1;
end
end