function errorMat = ivpmethods (f, x0, y0, h, xf, ytrue)
%absolute error = observed - true.
N = (xf - x0)/h;
x_initial = x0;
matrix_index = 1;
while x_initial <= xf
    x_column_matrix(matrix_index,1) = x_initial;
    x_initial = x_initial + h;
    matrix_index = matrix_index + 1;
end

[~,y1] = Euler(f, x0, y0, N, xf);
[~,y2] = Heun(f, x0, y0, N, xf);
[~,y3] = rk4(f, x0, y0, N, xf);

for i = 1:size(ytrue,1)
    y1(i,1) = abs(y1(i,1) - ytrue(i,1));
    y2(i,1) = abs(y2(i,1) - ytrue(i,1));
    y3(i,1) = abs(y3(i,1) - ytrue(i,1));
end

errorMat = [x_column_matrix y1 y2 y3];
end