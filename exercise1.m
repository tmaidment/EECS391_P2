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


%% 1(a) - plot the data
scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')
legend('setosa', 'versicolor', 'virginica')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

%% 1(b) - plot a linear decision boundary by hand
% note that the decision boundary I am using is between the versicolor and
% virginica classes
boundary = -1/2*X + 4;
hold on, plot(X, boundary)

%% 1(c) - define a simple threshold classifier
% this counts the number of data points that would be miss classified for
% each classification.
missclassifiedVersicolor = 0;
for i = 1:50
   if Yversicolor(i) >= -1/2*Xversicolor(i) + 4
       missclassifiedVersicolor = missclassifiedVersicolor + 1;
   end
end
for i = 1:50
   if Yvirginica(i) <= -1/2*Xvirginica(i) + 4
       missclassifiedVersicolor = missclassifiedVersicolor + 1;
   end
end

missclassifiedVirginca = 0;
for i = 1:50
   if Yvirginica(i) <= -1/2*Xvirginica(i) + 4
       missclassifiedVirginca = missclassifiedVirginca + 1;
   end
end
for i = 1:50
   if Yversicolor(i) >= -1/2*Xversicolor(i) + 4
       missclassifiedVirginca = missclassifiedVirginca + 1;
   end
end


missclassifiedVersicolor
missclassifiedVirginca

%% 1(d) - define a circle decision boundary

scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')
legend('setosa', 'versicolor', 'virginica')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

plotcircle(4.1, 1.2, 1.1, 'b')
plotcircle(5.7, 2, 1.1, 'b')

missclassifiedVersicolor = 0;
for i = 1:50
   if (4.1-Xversicolor(i))^2 + (1.2-Yversicolor(i))^2 > 1.1^2
       missclassifiedVersicolor = missclassifiedVersicolor + 1;
   end
end
for i = 1:50
   if (4.1-Xvirginica(i))^2 + (1.2-Yvirginica(i))^2 <= 1.1^2
       missclassifiedVersicolor = missclassifiedVersicolor + 1;
   end
end

missclassifiedVersicolor

missclassifiedVirginica = 0;
for i = 1:50
   if (5.7-Xvirginica(i))^2 + (2.0-Yvirginica(i))^2 > 1.1^2
       missclassifiedVirginica = missclassifiedVirginica + 1;
   end
end
for i = 1:50
   if (5.7-Xversicolor(i))^2 + (2.0-Yversicolor(i))^2 <= 1.1^2
       missclassifiedVirginica = missclassifiedVirginica + 1;
   end
end

missclassifiedVirginica

%% 1(d) - third circle - define a circle decision boundary

scatter(Xsetosa, Ysetosa, [], 'red', 'o')
hold on, scatter(Xversicolor, Yversicolor, [], 'green','x')
hold on, scatter(Xvirginica, Yvirginica, [], 'blue','+')
legend('setosa', 'versicolor', 'virginica')

xlabel('Length (mm)'), ylabel('Width (mm)')
title('Iris Data Set')
xlim([min(X) max(X)]), ylim([min(Y) max(Y)])

plotcircle(4.1, 1.2, 1.1, 'b')
plotcircle(5.9, 2, 1.2, 'b')

missclassifiedVersicolor = 0;
for i = 1:50
   if (4.1-Xversicolor(i))^2 + (1.2-Yversicolor(i))^2 > 1.1^2
       missclassifiedVersicolor = missclassifiedVersicolor + 1;
   end
end
for i = 1:50
   if (4.1-Xvirginica(i))^2 + (1.2-Yvirginica(i))^2 <= 1.1^2
       missclassifiedVersicolor = missclassifiedVersicolor + 1;
   end
end

missclassifiedVersicolor

missclassifiedVirginica = 0;
for i = 1:50
   if (5.9-Xvirginica(i))^2 + (2.0-Yvirginica(i))^2 > 1.2^2
       missclassifiedVirginica = missclassifiedVirginica + 1;
   end
end
for i = 1:50
   if (5.9-Xversicolor(i))^2 + (2.0-Yversicolor(i))^2 <= 1.2^2
       missclassifiedVirginica = missclassifiedVirginica + 1;
   end
end

missclassifiedVirginica
