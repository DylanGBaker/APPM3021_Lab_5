function ytrue = getTruePointsForFunction(f, h, x0, xf)
x_initial = x0;
matrix_index = 1;

while x_initial <= xf + h
    ytrue(matrix_index, 1) = f(x_initial);
    x_initial = x_initial + h;
    matrix_index = matrix_index + 1;
end
end