function error = mse(m, b, y, length_virginica, width_virginica, length_versicolor, width_versicolor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

error = 0;

for i = 1:50
    weight = b + (m * length_virginica(i)) + (y * width_virginica(i));
    error = error + (sigmoid(weight))^2;
end

for i = 1:50
    weight = b + (m * length_versicolor(i)) + (y * width_versicolor(i));
    error = error + (sigmoid(weight) - 1)^2;
end

error = 1/2 * (error / 100);
end

function sigvalue = sigmoid(x)
sigvalue = 1/(1 + exp(-x));
end