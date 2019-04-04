clc;
clear;
close all;

stl_name = 'trial1_updated_0826_setup1_2.stl';
file_name = 'xyz_data5_from_scan.csv';


view_stl(stl_name,[],[],0.3,[]);

hold on;

T = [
       -0.6270    0.7790    0.0093  333.4078;
   -0.7784   -0.6260   -0.0476  623.6449;
   -0.0313   -0.0371    0.9988   30.3042;
         0         0         0    1.0000
];

file_pts = dlmread(file_name);

hold on;
scatter3d(file_pts,'.');
hold on;

transformed_pts = apply_transformation(file_pts(:,1:3),T);
scatter3d(transformed_pts,'.');

transformed_pts = transformed_pts,

% % [a,b] = generate_sample_data_for_icp_from_STL(stl_name)
% % 
% % dlmwrite('sample_25_model_ptcloud.csv',a)
% 
% T = [-0.6209   -0.7833    0.0306    674.4;
%    0.7839   -0.6202    0.0291    110.4;
%   -0.0038    0.0420    0.9991    5.4;
%   0 0 0 1];
% 
% view_stl(stl_name,[],[],0.3,[]);
% 
% file_pts = dlmread(file_name);
% 
% hold on;
% scatter3d(file_pts,'.');
% hold on;
% 
% transformed_pts = apply_transformation(file_pts(:,1:3),inv(T));
% scatter3d(transformed_pts,'.');
% 
% dlmwrite('xyz_data1_from_scan_transformed_stage1.csv',transformed_pts)