clear;
clc;
close all;

% Choose what color the CAD part needs to be displayed.
col_matrix = [0.941176, 0.972549, 1];

global stl_file;

[v, f, n, stltitle] = stlRead(stl_file);

delete(gca);
close all;    
[v,n,a,b] = robot_to_part( v,n,[],[] );
figure(1)
hold on;
patch('Faces',f,'Vertices',v,'FaceVertexCData',col_matrix,'FaceColor',col_matrix,'FaceAlpha',0.5);

info = dlmread('/home/rflin/Desktop/ICP_new/GUI_scan_traj/xyz_frames.csv');
info(:,1:3) = info(:,1:3);     % mm to m scaling

[points,bx,by,bz] = robot_to_part(info(:,1:3),info(:,4:6),info(:,7:9),info(:,10:12));

% cba = compute_euler(bx,by,bz);
% cba = real(cba);
xyz_bxbybz = horzcat(points,bx,by,bz);

% Plotting Global 
scatter3(0,0,0,300,'*','k'); %Plot the Points
plot_tcp([1,0,0],[0,1,0],[0,0,1],[0,0,0]);

scatter3(points(:,1),points(:,2),points(:,3),200,'*','b'); %Plot the Points
daspect([1 1 1]);

%data for icp ...making values in meters to run the single_iiwa_curve_tracing.m
xyz_bxbybz(:,1:3) = xyz_bxbybz(:,1:3)./1000;
dlmwrite('/home/rflin/Desktop/ICP_new/GUI_scan_traj/scan_traj_xyz_bxbybz.csv',xyz_bxbybz);
disp(size(xyz_bxbybz));
