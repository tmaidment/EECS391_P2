function delta = optimize_gradient(m, b, y, length_virginica, width_virginica, length_versicolor, width_versicolor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

delta = [m b y];

deltas = zeros(200, 3);

optimized_mse = zeros(1, 200);

optimized_mse(1) = mse(delta(1), delta(2), delta(3), length_virginica, width_virginica, length_versicolor, width_versicolor);
i = 1;


while (optimized_mse(i) >= mse(delta(1), delta(2), delta(3), length_virginica, width_virginica, length_versicolor, width_versicolor))
    
i = i + 1;

gradient_out = gradient(delta(1), delta(2), delta(3), length_virginica, width_virginica, length_versicolor, width_versicolor);

optimized_mse(i) = mse(delta(1), delta(2), delta(3), length_virginica, width_virginica, length_versicolor, width_versicolor);

gradient_out = 0.05 .* gradient_out;

delta = delta - gradient_out;

deltas(i,:) = delta;

end

figure, plot(optimized_mse);

delta = [delta deltas(floor(i/2),:)];

end