function [x,y]= RK4system (f, xspan, y0, N)
y0 = num2cell(y0);
y_initial = y0;
x_initial = xspan(1);
x_final = xspan(2);
h = (xspan(2) - xspan(1))/N;
matrix_index = 1;
k_one = zeros(size(y0,1),1)
k_two = zeros(size(y0,1),1)
k_three = zeros(size(y0,1),1)
k_four = zeros(size(y0,1),1)

while x_initial <= x_final
    x(matrix_index,1) = x_initial;
    for i = 1:size(y0,2)
        y(matrix_index,i) = y_initial{1,i};
    end
    

    for i = 1:size(y0,2)
        temp = f{i};
        k_one(i,1) = h * (temp(x_initial, y0{:}));
        x_initial_change = x_initial;

        x_initial_change = x_initial_change + h/2;
        for k = 1:size(y0,2)
            y_initial_change{k,1} = y0{1,k} + k_one(i,1)/2;
        end

        k_two(i,1) = h * (temp(x_initial_change, y_initial_change{:}));

        for k = 1:size(y0,1)
            y_initial_change{k,1} = y0{k,1} + k_two(i,1)/2;
        end

        k_three(i,1) = h * (temp(x_initial_change, y_initial_change{:}));

        x_initial_change = x_initial;
        x_initial_change = x_initial_change + h;
        for k = 1:size(y0,1)
            y_initial_change{1,k} = y0{1,k} + k_three(i,1);
        end
        
        k_four(i,1) = h * (temp(x_initial_change, y_initial_change{:}));
    end

    %%%%%%%%%%%

    for i = 1:size(y0,2)
        y_initial_plus_one(1,i) = y_initial{1,i} + (1/6 * (k_one(i,1) + 2*k_two(i,1) + 2*k_three(i,1) + k_four(i,1)));
        y_initial{1,i} = y_initial_plus_one(1,i);
    end
    x_initial = x_initial + h;
    matrix_index = matrix_index + 1;
end
end