clc;
clear;
close all;

%plane fit
a = randi([-10,10],10,2);
% a = [a,randi([0,1],10,1)];
a = [a,0.5*rand(10,1)];
scatter3(a(:,1),a(:,2),a(:,3),'filled');
daspect([1 1 1]);
%plane fitting

store = randi([-10,10],10,2);
[zval] = get_pt_to_lsf_plane_dist(store,a);
tri = [store,zval];[store(1,:),zval(1)];
hold on;
scatter3(tri(:,1),tri(:,2),tri(:,3),'filled');
hold on;
plot3(tri(:,1),tri(:,2),tri(:,3));


% clc;
% clear;
% close all;
% 
% %plane fit
% a = randi([-10,10],10,2);
% % a = [a,randi([0,1],10,1)];
% a = [a,0.5*rand(10,1)];
% scatter3(a(:,1),a(:,2),a(:,3),'filled');
% daspect([1 1 1]);
% %plane fitting
% x = a(:,1); y = a(:,2); z = a(:,3);
% x_avg = mean(a(:,1));y_avg = mean(a(:,2));z_avg = mean(a(:,3));
% L00 = sum((x-x_avg).^2);
% L01 = sum((x-x_avg).*(y-y_avg));
% L11 = sum((y-y_avg).^2);
% R0 = sum((z-z_avg).*(x-x_avg));
% R1 = sum((z-z_avg).*(y-y_avg));
% 
% a2 = -((L11*R0-L01*R1)/(L00*L11-L01^2));
% b2 = -((L00*R1-L01*R0)/(L00*L11-L01^2));
% c2 = 1;
% d2 = -(z_avg+a2*x_avg+b2*y_avg);
% 
% 
% zval = [];
% store = randi([-10,10],10,2);
% zval = [((-d2-(a2*store(:,1))-(b2*store(:,2)))/c2)];
% tri = [store,zval];[store(1,:),zval(1)];
% hold on;
% scatter3(tri(:,1),tri(:,2),tri(:,3),'filled');
% hold on;
% plot3(tri(:,1),tri(:,2),tri(:,3));
% 













