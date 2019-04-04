clc;
clear;
close all;

%plane fit
a = randi([-10,10],3,3);
% a =  [8    -5    -1;
%     -1    -9    -1;
%     -7    -6    -3];

p1 = a(1,:);
p2 = a(2,:);
p3 = a(3,:);
tri = [p1;p2;p3;p1]
scatter3(tri(:,1),tri(:,2),tri(:,3),'filled');
hold on;
plot3(tri(:,1),tri(:,2),tri(:,3));
xlabel('x');ylabel('y');zlabel('z');

a1 = ((p2(2)-p1(2))*(p3(3)-p1(3)))-((p3(2)-p1(2))*(p2(3)-p1(3)));
b1 = ((p2(3)-p1(3))*(p3(1)-p1(1)))-((p3(3)-p1(3))*(p2(1)-p1(1)));
c1 = ((p2(1)-p1(1))*(p3(2)-p1(2)))-((p3(1)-p1(1))*(p2(2)-p1(2)));
d1 = -(a1*p1(1))-(b1*p1(2))-(c1*p1(3));
a1 = a1/c1;b1 = b1/c1;d1 = d1/c1;c1 = c1/c1;
% 
% zval = [];
% store = randi([-10,10],3,2);
% for i = 1:size(store,1)
% zval = [zval;((-d-(a*store(i,1))-(b*store(i,2)))/c)];
% end
% tri = [store,zval];[store(1,:),zval(1)];
% hold on;
% scatter3(tri(:,1),tri(:,2),tri(:,3),'filled');
% hold on;
% plot3(tri(:,1),tri(:,2),tri(:,3));



%plane fitting
x = a(:,1); y = a(:,2); z = a(:,3);
x_avg = mean(a(:,1));y_avg = mean(a(:,2));z_avg = mean(a(:,3));
L00 = sum((x-x_avg).^2);
L01 = sum((x-x_avg).*(y-y_avg));
L11 = sum((y-y_avg).^2);
R0 = sum((z-z_avg).*(x-x_avg));
R1 = sum((z-z_avg).*(y-y_avg));

a2 = -((L11*R0-L01*R1)/(L00*L11-L01^2));
b2 = -((L00*R1-L01*R0)/(L00*L11-L01^2));
c2 = 1;
d2 = -(z_avg+a2*x_avg+b2*y_avg);

disp([a1,a2]);disp([b1,b2]);disp([c1,c2]);disp([d1,d2]);

zval = [];
store = randi([-10,10],3,2);
for i = 1:size(store,1)
zval = [zval;((-d2-(a2*store(i,1))-(b2*store(i,2)))/c2)];
end
tri = [store,zval];[store(1,:),zval(1)];
hold on;
scatter3(tri(:,1),tri(:,2),tri(:,3),'filled');
hold on;
plot3(tri(:,1),tri(:,2),tri(:,3));








