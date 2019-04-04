%world frame is robot base frame
clc;
clear;
close all;
dbstop if error;
set(0, 'DefaultFigureRenderer', 'opengl');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run global_CONFIG.m

figure;
%plotting robot base
scatter3(0,0,0,100,'d','filled','r');
hold on;
quiver3(0,0,0,1,0,0,100,'r');hold on;quiver3(0,0,0,0,1,0,100,'g');hold on;quiver3(0,0,0,0,0,1,100,'b');
hold on;
%plotting part ptcloud
scatter3d(part_ptcloud,'.');
hold on;
%plotting scan traj
scatter3d(scan_traj,'*');

transformed_ptcloud = apply_transformation(part_ptcloud,True_w_T_p);
hold on;
scatter3d(transformed_ptcloud,'.');
KDtree = KDTreeSearcher(transformed_ptcloud);
num_of_neighbours = 1;
idx = knnsearch(KDtree,scan_traj,'K',num_of_neighbours);
corresponding_val_from_part_ptcloud = transformed_ptcloud(idx,:);
Error_max_d = max(dist(corresponding_val_from_part_ptcloud,scan_traj));
Error_mean_d = sum(dist(corresponding_val_from_part_ptcloud,scan_traj))/size(scan_traj,1);
fprintf('max_d :%f, mean_d :%f\n',Error_max_d,Error_mean_d);