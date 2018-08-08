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

%% 2(a)

scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

boundary = -1/2*X + 3;
hold on, plot(X, boundary)

%decision boundary from Exercise 1
boundary = -1/2*X + 4;
hold on, plot(X, boundary)

boundary = -1/2*X + 5;
hold on, plot(X, boundary)

legend('setosa', 'versicolor', 'virginica', 'Boundary 3', 'Original Boundary', 'Boundary 5')

error3 = mse(-1/2, 3, -1, Xvirginica, Yvirginica, Xversicolor, Yversicolor)

error_original = mse(-1/2, 4, -1, Xvirginica, Yvirginica, Xversicolor, Yversicolor)

error5 = mse(-1/2, 5, -1, Xvirginica, Yvirginica, Xversicolor, Yversicolor)

%% 2(e) 

% boundary values in an array [m b y]
values = [-1/2, 4, -1]
gradient_out = gradient(-1/2, 4, -1, Xvirginica, Yvirginica, Xversicolor, Yversicolor)

delta = values - gradient_out

scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

boundary = -1/2*X + 4;
hold on, plot(X, boundary)

boundary = (delta(1)*X + delta(2))/-delta(3);
hold on, plot(X, boundary)

legend('setosa', 'versicolor', 'virginica', 'Original Boundary', 'New Boundary')