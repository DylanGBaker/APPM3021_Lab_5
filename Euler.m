function [x,y] = Euler(f, x0, y0, N, xf)
y_initial = y0;
x_initial = x0;
x_final = xf;
h = (x_final - x_initial)/N;
matrix_index = 1;

while x_initial <= xf + h
    x(matrix_index,1) = x_initial;
    y(matrix_index,1) = y_initial;
    y_initial_plus_one = y_initial + (h)*(f(x_initial, y_initial));
    x_initial = x_initial + h;
    y_initial = y_initial_plus_one;
    matrix_index = matrix_index + 1;
end
end