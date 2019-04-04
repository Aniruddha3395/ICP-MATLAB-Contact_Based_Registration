clc;
clear;
close all;

scan_pts_file = 'sample_24_scan_ptcloud.csv';
part_pts_file = 'sample_24_model_ptcloud.csv';

write_into_file = false;

pts = dlmread(scan_pts_file);

%arbitraty rotations and translations to distort current ptcloud
rot = rotz(-5);
trans = [0;20;0];
T = [rot,trans;0 0 0 1]

% rot = rotz(-90)*rotx(90);
% % rot = rotz(90)*roty(90)*rotx(0);
% % rot = eul2rotm([-pi/2 0 pi/2]);
% % trans = [539.5;-34.04;66.04];
% trans = [66.04;539.5;34.04];
% 
% T = [rot,trans;0 0 0 1]
% T = eye(4);

new_pts = apply_transformation(pts,T);

% scatter3d(pts,'.');
hold on;
scatter3d(new_pts,'.');
hold on;
partpts = dlmread(part_pts_file);
scatter3d(partpts,'.');

if write_into_file
    dlmwrite(scan_pts_file,new_pts);
end

