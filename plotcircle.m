function plotcircle(x1,y1,r,c)
% x1,y1: center
% r = radius
theta = 0:0.05:2*pi;
hold on;
plot(x1+r*cos(theta),y1+r*sin(theta),c);
end