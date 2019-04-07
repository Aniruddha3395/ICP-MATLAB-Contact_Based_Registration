% world frame is robot base frame

set(0, 'DefaultFigureRenderer', 'opengl');
global tool_F_T_tcp;
global icp_dir;

%%%%%%%%%%<< PATH for ICP >>%%%%%%%%%%%%
% give appropriate path of ICP folder
icp_dir = '/home/aniruddha/Desktop/GIT/ICP-MATLAB-Contact_Based_Registration/';

%%%%%%%%%%%%%%%%%%%%%%%%%% << INPUTS >> %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% give appropriate inputs

% Tool frame transformation of TCP wrt Flange (T_tcp_wrt_F) tool
% NOTE: Transformation is zero when points with respect to flange
tool_t = [0;0;104.9];                % in mm
tool_r = eul2rotm([0 0 0]);                % in rad (alpha beta gamma rot)
tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];

% STL File
% NOTE: will be used to generate the model pointcloud)
stl_file = 'Heli_Blade.STL';

% Input tranformation matrix for ICP
% NOTE: either express in 4by4 matrix or in euler angle and xyz
% input_w_t_p = [478.4168;-160.7013;300.4602];
% input_w_r_p = eul2rotm([5,15,5].*(pi/180));
% input_w_T_p = [input_w_r_p,input_w_t_p;0 0 0 1];
% input_w_T_p = [
%     0.9994   -0.0214   -0.0257  478.4168;
%     0.0214    0.9998   -0.0015 -160.7013;
%     0.0257    0.0009    0.9997  330.4602;
%     0         0         0    1.0000
%     ];

% transformation for Composite Mold and iiwa 14
input_w_T_p = [
    -0.9998    0.0217   -0.0009  867.1061
    -0.0217   -0.9998    0.0012  271.0798
    -0.0009    0.0012    1.0000   11.3983
    0         0         0    1.0000
    ];

% transformation for dome and iiwa 14
input_w_T_p = eye(4);
input_w_T_p(1,4) = 381;
input_w_T_p(2,4) = 736;
input_w_T_p(1:3,1:3) = rotz(180);

cba = rotm2eul(input_w_T_p(1:3,1:3));
cba(1) = cba(1)+2*pi/180;
cba(2) = cba(2)+2*pi/180;
cba(3) = cba(3)+2*pi/180;
input_w_T_p(1,4) = input_w_T_p(1,4) + 5;
input_w_T_p(2,4) = input_w_T_p(2,4) - 1;
input_w_T_p(3,4) = input_w_T_p(3,4) + 1;

% transformation between skylight hood and iiwa 14






input_w_T_p(1:3,1:3) = eul2rotm(cba);

generate_model_data = false;
generate_scan_traj_data = true;
visualize_data = true;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if generate_model_data
    [part_ptcloud,part_ptcloud_normals] = generate_part_ptcloud_from_part_STL(...
        strcat(icp_dir,stl_file));
else
    part_ptcloud = dlmread(strcat(icp_dir,'data_files/part_ptcloud.csv'));
    part_ptcloud_normals = dlmread(strcat(icp_dir,'data_files/part_ptcloud_normals.csv'));
end
if generate_scan_traj_data
    scan_traj = get_traj_wrt_tcp(strcat(icp_dir,'data_files/probing_data.csv'));
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