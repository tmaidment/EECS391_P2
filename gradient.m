function error = gradient(m, b, y, length_virginica, width_virginica, length_versicolor, width_versicolor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

error0 = 0;
error1 = 0;
error2 = 0;

% 1
for i = 1:50
    weight = b + (m * length_virginica(i)) + (y * width_virginica(i));
    error0 = error0 + (sigmoid(weight)) * d_sigmoid(weight) * 1;
end

for i = 1:50
    weight = b + (m * length_versicolor(i)) + (y * width_versicolor(i));
    error0 = error0 + (sigmoid(weight) - 1) * d_sigmoid(weight) * 1;
end

% Xn
for i = 1:50
    weight = b + (m * length_virginica(i)) + (y * width_virginica(i));
    error1 = error1 + (sigmoid(weight)) * d_sigmoid(weight) * length_virginica(i);
end

for i = 1:50
    weight = b + (m * length_versicolor(i)) + (y * width_versicolor(i));
    error1 = error1 + (sigmoid(weight) - 1) * d_sigmoid(weight) * length_versicolor(i);
end

% Yn
for i = 1:50
    weight = b + (m * length_virginica(i)) + (y * width_virginica(i));
    error2 = error2 + (sigmoid(weight)) * d_sigmoid(weight) * width_virginica(i);
end

for i = 1:50
    weight = b + (m * length_versicolor(i)) + (y * width_versicolor(i));
    error2 = error2 + (sigmoid(weight) - 1) * d_sigmoid(weight) * width_versicolor(i);
end


error = 2/100 .* [error0, error1, error2];
end

function sigvalue = sigmoid(x)
sigvalue = 1/(1 + exp(-x));
end

function sigvalue = d_sigmoid(x)
sigvalue = sigmoid(x) * (1 - sigmoid(x));
end