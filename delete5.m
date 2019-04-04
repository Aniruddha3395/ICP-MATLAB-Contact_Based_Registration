global tool_F_T_tcp data_file_dir icp_dir data_set_num;
%%%%%%%%%%%%%%%%%
% Tool frame transformation of TCP wrt Flange (T_tcp_wrt_F) tool
% transformation is zero when pts wrt flange
icp_dir = 'C:/Users/ABB IRB120/Desktop/';
%%%%%%%%%%%%%%%%%
[tool_F_T_tcp,data_file_dir,stl_file,True_w_T_p] = data_set(data_set_num);
%%%%%%%%%%%%%%%%%
generate_model_data = false;
generate_scan_traj_data = false;
visualize_data = false;
if generate_model_data
    [part_ptcloud,part_ptcloud_normals] = generate_part_ptcloud_from_part_STL(...
        strcat(icp_dir,stl_file));
else
    part_ptcloud = dlmread(strcat(icp_dir,data_file_dir,'part_ptcloud.csv'));
    part_ptcloud_normals = dlmread(strcat(icp_dir,data_file_dir,'part_ptcloud_normals.csv'));
end
if generate_scan_traj_data
    scan_traj = get_traj_wrt_tcp(strcat(icp_dir,data_file_dir,'data_for_ICP.csv'));
else
    scan_traj = dlmread(strcat(icp_dir,data_file_dir,'scanned_traj.csv'));
end
if visualize_data
    figure;
    scatter3d(part_ptcloud,'.b');
    hold on;
    scatter3d(scan_traj,'.g');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        DATA         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data1: car bonnet old position
% data2-data4: car bonnet new position
% data5-data7: GE blade
% data8-data10: composite mold
% data11-data13: fender


function [tool_F_T_tcp,data_file_dir,stl_file,True_w_T_p] = data_set(data_num)

switch data_num
    
    case 1
        %%%%%% data1 %%%%%
        tool_t = [-0.2;-0.01;48.6];                    % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data1/';
        stl_file = 'ICP_new/STL_CAD/car_bonnet_1031_new.stl';
        True_w_T_p = [
            1.0000   -0.0001    0.0002  477.4196;
            0.0001    1.0000    0.0014 -143.6004;
            -0.0003   -0.0014    1.0000  311.3996;
            0         0         0    1.0000
            ];
        
    case 2
        %%%%%% data2 %%%%%
        tool_t = [1.7;0.7;45.6];                       % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data2/';
        stl_file = 'ICP_new/STL_CAD/car_bonnet_1031_new.stl';
        True_w_T_p = [
            0.9999    0.0126         0    518.4;
           -0.0126    0.9999         0   -160.8;
                 0         0    1.0000    314.3;
                 0         0         0    1.0000
            ];

    case 3
        %%%%%% data3 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data3/';
        stl_file = 'ICP_new/STL_CAD/car_bonnet_1031_new.stl';
        True_w_T_p = [
            0.9999    0.0126         0    518.4;
           -0.0126    0.9999         0   -160.8;
                 0         0    1.0000    314.3;
                 0         0         0    1.0000
            ];

    case 4
        %%%%%% data4 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data4/';
        stl_file = 'ICP_new/STL_CAD/car_bonnet_1031_new.stl';
        True_w_T_p = [
            0.9999    0.0126         0    518.4;
           -0.0126    0.9999         0   -160.8;
                 0         0    1.0000    314.3;
                 0         0         0    1.0000
            ];

    case 5
        %%%%%% data5 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data5/';
        stl_file = 'ICP_new/STL_CAD/ge_wing_1106.stl';
        True_w_T_p = [
            0.0000   -1.0000         0  691.9300;
            1.0000    0.0000         0 -171.7000;
                 0         0    1.0000  319.7000;
                 0         0         0    1.0000
            ];

    case 6
        %%%%%% data6 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data6/';
        stl_file = 'ICP_new/STL_CAD/ge_wing_1106.stl';
        True_w_T_p = [
            0.0000   -1.0000         0  691.9300;
            1.0000    0.0000         0 -171.7000;
                 0         0    1.0000  319.7000;
                 0         0         0    1.0000
            ];

    case 7
        %%%%%% data7 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data7/';
        stl_file = 'ICP_new/STL_CAD/ge_wing_1106.stl';
        True_w_T_p = [
            0.0000   -1.0000         0  691.9300;
            1.0000    0.0000         0 -171.7000;
                 0         0    1.0000  319.7000;
                 0         0         0    1.0000
            ];

    case 8
        %%%%%% data8 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data8/';
        stl_file = 'ICP_new/STL_CAD/composite_mold_1106.stl';
        True_w_T_p = [
            1.0000         0         0  315.1300;
                 0    1.0000         0 -307.7100;
                 0         0    1.0000  116.7200;
                 0         0         0    1.0000
            ];

    case 9
        %%%%%% data9 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data9/';
        stl_file = 'ICP_new/STL_CAD/composite_mold_1106.stl';
        True_w_T_p = [
            1.0000         0         0  315.1300;
                 0    1.0000         0 -307.7100;
                 0         0    1.0000  116.7200;
                 0         0         0    1.0000
            ];

    case 10
        %%%%%% data10 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data10/';
        stl_file = 'ICP_new/STL_CAD/composite_mold_1106.stl';
        True_w_T_p = [
            1.0000         0         0  315.1300;
                 0    1.0000         0 -307.7100;
                 0         0    1.0000  116.7200;
                 0         0         0    1.0000
            ];

    case 11
        %%%%%% data11 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data11/';
        stl_file = 'ICP_new/STL_CAD/fender_1106.stl';
        True_w_T_p = [
           -1.0000   -0.0000         0  583.8800;
            0.0000   -1.0000         0  346.2500;
                 0         0    1.0000    2.7400;
                 0         0         0    1.0000
            ];

    case 12
        %%%%%% data12 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data12/';
        stl_file = 'ICP_new/STL_CAD/fender_1106.stl';
        True_w_T_p = [
           -1.0000   -0.0000         0  583.8800;
            0.0000   -1.0000         0  346.2500;
                 0         0    1.0000    2.7400;
                 0         0         0    1.0000
            ];
        
    case 13         
        %%%%%% data13 %%%%%
        tool_t = [1.7;0.7;45.6];                         % in mm
        tool_r = eul2rotm([0 0 0]);                    % in rad (alpha beta gamma rot)
        tool_F_T_tcp = [tool_r,tool_t;0 0 0 1];
        data_file_dir = 'ICP_new/data_files/data13/';
        stl_file = 'ICP_new/STL_CAD/fender_1106.stl';
        True_w_T_p = [
           -1.0000   -0.0000         0  583.8800;
            0.0000   -1.0000         0  346.2500;
                 0         0    1.0000    2.7400;
                 0         0         0    1.0000
            ];
        
end
end