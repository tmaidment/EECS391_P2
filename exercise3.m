%% import the data
irisdata = importfile('irisdata.csv', 2, 151);

X = irisdata{:,3};
Y = irisdata{:,4};

Xsetosa = X(1:50);
Xversicolor = X(51:100);
Xvirginica = X(101:150);
Ysetosa = Y(1:50);
Yversicolor = Y(51:100);
Yvirginica = Y(101:150);

%% 3(a)
% boundary values in an array [m b y]
gradient_out = optimize_gradient(-1/2, 4, -1, Xvirginica, Yvirginica, Xversicolor, Yversicolor);

figure, scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

mse(-1/2, 4, -1, Xvirginica, Yvirginica, Xversicolor, Yversicolor)
boundary = -1/2*X + 4;
hold on, plot(X, boundary)

mse(gradient_out(1), gradient_out(2), gradient_out(3), Xvirginica, Yvirginica, Xversicolor, Yversicolor)
boundary = (gradient_out(1)*X + gradient_out(2))/-gradient_out(3);
hold on, plot(X, boundary)

legend('setosa', 'versicolor', 'virginica', 'Original Boundary', 'New Boundary')

%% 3(c)
% boundary values in an array [m b y]

m = -1/2 + rand(1,1)*0.1
b = 5 - rand(1,1)*3
y = -1 + rand(1,1)*0.1

gradient_out = optimize_gradient(m, b, y, Xvirginica, Yvirginica, Xversicolor, Yversicolor);

figure, scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

original_mse = mse(m, b, y, Xvirginica, Yvirginica, Xversicolor, Yversicolor)
boundary = (m*X + b)/-y;
hold on, plot(X, boundary)

middle_mse = mse(gradient_out(4), gradient_out(5), gradient_out(6), Xvirginica, Yvirginica, Xversicolor, Yversicolor)
boundary = (gradient_out(4)*X + gradient_out(5))/-gradient_out(6);
hold on, plot(X, boundary)

new_mse = mse(gradient_out(1), gradient_out(2), gradient_out(3), Xvirginica, Yvirginica, Xversicolor, Yversicolor)
boundary = (gradient_out(1)*X + gradient_out(2))/-gradient_out(3);
hold on, plot(X, boundary)

legend('setosa', 'versicolor', 'virginica', 'Original Boundary', 'Middle Boundary','New Boundary')