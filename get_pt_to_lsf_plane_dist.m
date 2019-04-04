function [dist_p_plane] = get_pt_to_lsf_plane_dist(p,pts_for_plane)

x_avg = mean(pts_for_plane(:,1));
y_avg = mean(pts_for_plane(:,2));
z_avg = mean(pts_for_plane(:,3));
L00 = sum((pts_for_plane(:,1)-x_avg).^2);
L01 = sum((pts_for_plane(:,1)-x_avg).*(pts_for_plane(:,2)-y_avg));
L11 = sum((pts_for_plane(:,2)-y_avg).^2);
R0 = sum((pts_for_plane(:,3)-z_avg).*(pts_for_plane(:,1)-x_avg));
R1 = sum((pts_for_plane(:,3)-z_avg).*(pts_for_plane(:,2)-y_avg));

A = -((L11*R0-L01*R1)/(L00*L11-L01^2));
B = -((L00*R1-L01*R0)/(L00*L11-L01^2));
C = 1;
D = -(z_avg+A*x_avg+B*y_avg);

dist_p_plane = abs(A*p(1)+B*p(2)+C*p(3)+D)/(sqrt(A^2+B^2+C^2));

end