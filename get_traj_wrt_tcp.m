function [scan_traj_wrt_tcp] = get_traj_wrt_tcp(file_name)

global tool_F_T_tcp icp_dir;
%get appropriate scan data for ICP
traj_from_kuka_scanning = dlmread(file_name);

pts_from_tcp_publisher = unique(traj_from_kuka_scanning,'stable','rows');
pts_from_tcp_publisher(:,1:3) = pts_from_tcp_publisher(:,1:3).*1000;

% angles values must be radians
transformed_pt = zeros(size(pts_from_tcp_publisher,1),6);
for i = 1:size(pts_from_tcp_publisher,1)
    b_t_Flange = [pts_from_tcp_publisher(i,1);pts_from_tcp_publisher(i,2);pts_from_tcp_publisher(i,3)];
    b_r_Flange = eul2rotm([pts_from_tcp_publisher(i,4),pts_from_tcp_publisher(i,5),pts_from_tcp_publisher(i,6)]);
    b_T_Flange = [b_r_Flange,b_t_Flange;0 0 0 1] ;
    b_T_tcp = b_T_Flange*tool_F_T_tcp;
    new_r = b_T_tcp(1:3,1:3);
    
    transformed_pt(i,:) = [b_T_tcp(1:3,4)',(rotm2eul(new_r).*(180/pi))];
end

%saves only xyz and not euler angles
scan_traj_wrt_tcp = transformed_pt(:,1:3);
dlmwrite(strcat(icp_dir,'data_files/scanned_traj.csv'),scan_traj_wrt_tcp);
end
