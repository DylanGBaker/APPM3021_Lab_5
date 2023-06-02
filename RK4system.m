function [x,y]= RK4system (f, xspan, y0, N)
y0 = num2cell(y0);
y_initial = y0;
x_initial = xspan(1);
x_final = xspan(2);
number_of_sub_intervals = 0;
h = (xspan(2) - xspan(1))/N;
matrix_index = 1;
k_one = zeros(size(y0,1),1)
k_two = zeros(size(y0,1),1)
k_three = zeros(size(y0,1),1)
k_four = zeros(size(y0,1),1)

while x_initial <= x_final
    x(matrix_index,1) = x_initial;
    y(matrix_index,1) = y_initial(matrix_index,1);

    for i = 1:size(y0,1)
        temp = f{i};
        k_one(i,1) = h * (temp(x_initial, y0{:}));
        x_initial_change = x_initial;

        x_initial_change = x_initial_change + h/2;
        for k = 1:size(y0,1)
            y_initial_change{k,1} = y0{k,1} + k_one(i,1)/2;
        end

        k_two(i,1) = h * (temp(x_initial_change, y_initial_change{:}));

        for k = 1:size(y0,1)
            y_initial_change{k,1} = y0{k,1} + k_two(i,1)/2;
        end

        k_three(i,1) = h * (temp(x_initial_change, y_initial_change{:}));

        x_initial_change = x_initial;
        x_initial_change = x_initial_change + h;
        for k = 1:size(y0,1)
            y_initial_change{k,1} = y0{k,1} + k_three(i,1);
        end
        
        k_four(i,1) = h * (temp(x_initial_change, y_initial_change{:}));
                    disp(k_one)
                    disp(k_two)
                    disp(k_three)
                    disp(k_four)
    end

    %%%%%%%%%%%

    %y_initial_plus_one = y_initial + (1/6) * (k_one + (2 * k_two) + (2 * k_three) + k_four);
    %x_initial = x_initial + h;
    %y_initial = y_initial_plus_one;
    %matrix_index = matrix_index + 1;
end
end