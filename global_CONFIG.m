% world frame is robot base frame

set(0, 'DefaultFigureRenderer', 'opengl');
global tool_F_T_tcp; 
global icp_dir;

%%%%%%%%%%<< PATH for ICP >>%%%%%%%%%%%%
% give appropriate path of ICP folder
icp_dir = 'C:/Users/ABB IRB120/Desktop/ICP/';

%%%%%%%%%%%%%%%%%%%%%%%%%% << INPUTS >> %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% give appropriate inputs

% Tool frame transformation of TCP wrt Flange (T_tcp_wrt_F) tool
% NOTE: Transformation is zero when points with respect to flange
tool_t = [-0.2;-0.01;48.6];                % in mm
tool_r = eul2rotm([0 0 0]);                % in rad (alpha beta gamma rot)
tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];

% STL File 
% NOTE: will be used to generate the model pointcloud)
stl_file = 'car_bonnet_1031_new.stl';

% Input tranformation matrix for ICP
% NOTE: either express in 4by4 matrix or in euler angle and xyz 
input_w_t_p = [478.4168;-160.7013;300.4602];
input_w_r_p = eul2rotm([5,15,5].*(pi/180));
input_w_T_p = [input_w_r_p,input_w_t_p;0 0 0 1];
% input_w_T_p = [
%     0.9994   -0.0214   -0.0257  478.4168;
%     0.0214    0.9998   -0.0015 -160.7013;
%     0.0257    0.0009    0.9997  330.4602;
%     0         0         0    1.0000
%     ];

generate_model_data = false;
generate_scan_traj_data = false;
visualize_data = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if generate_model_data
    [part_ptcloud,part_ptcloud_normals] = generate_part_ptcloud_from_part_STL(...
        strcat(icp_dir,stl_file));
else
    part_ptcloud = dlmread(strcat(icp_dir,'data_files/part_ptcloud.csv'));
    part_ptcloud_normals = dlmread(strcat(icp_dir,'data_files/part_ptcloud_normals.csv'));
end
if generate_scan_traj_data
    scan_traj = get_traj_wrt_tcp(strcat(icp_dir,'data_files/data_for_ICP.csv'));
else
    scan_traj = dlmread(strcat(icp_dir,'data_files/scanned_traj.csv'));
end
input_part_ptcloud_icp = apply_transformation(part_ptcloud,input_w_T_p);
if visualize_data
    figure;
    scatter3d(input_part_ptcloud_icp,'.b');
    hold on;
    scatter3d(scan_traj,'.g');
end