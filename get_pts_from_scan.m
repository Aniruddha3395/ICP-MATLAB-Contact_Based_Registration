function pts_from_tcp_publisher_wrt_tcp =  get_pts_from_scan(pts_from_tcp_publisher,T_tcp_wrt_F,tcp_publisher_pts_are_flange_pts)

pts_from_tcp_publisher = unique(pts_from_tcp_publisher,'stable','rows');

if tcp_publisher_pts_are_flange_pts
    tcp_pts = get_pt_wrt_tcp(pts_from_tcp_publisher,T_tcp_wrt_F);
else
    tcp_pts = pts_from_tcp_publisher;
end

%saves only xyz and not euler angles
pts_from_tcp_publisher_wrt_tcp = tcp_pts(:,1:3);

% scatter3d(pts_from_tcp_publisher_wrt_tcp,'.');
% hold on;
% scatter3d(pts_from_tcp_publisher,'*');
% hold on;
end