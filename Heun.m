function [x,y] = Heun(f,x0,y0,N,xf)
y_initial = y0;
x_initial = x0;
x_final = xf;
number_of_sub_intervals = 0;
h = (x_final - x_initial)/N;
matrix_index = 1;

while x_initial <= xf
    %Need to do the euler method first
    x(matrix_index,1) = x_initial;
    y(matrix_index,1) = y_initial;

    y_initial_plus_one = y_initial + (h)*(f(x_initial, y_initial)); %Euler method iterative equation
    x_initial_plus_one = x_initial + h; % X_i+1

    %%%%%%%%
    y_initial_plus_one = y_initial + (h/2)*(f(x_initial, y_initial) + f(x_initial_plus_one, y_initial_plus_one));
    x_initial = x_initial_plus_one;
    y_initial = y_initial_plus_one;
    matrix_index = matrix_index + 1;
end
end