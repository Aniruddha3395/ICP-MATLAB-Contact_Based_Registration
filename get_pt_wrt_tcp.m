function [transformed_pt] = get_pt_wrt_tcp(pts,T_tcp_wrt_F)
% angles values must be radians

transformed_pt = zeros(size(pts,1),6);

for i = 1:size(pts,1)
    t_F_wrt_b = [pts(i,1);pts(i,2);pts(i,3)];
    r_F_wrt_b = eul2rotm([pts(i,4),pts(i,5),pts(i,6)]);
    T_F_wrt_b = [r_F_wrt_b,t_F_wrt_b;0 0 0 1] ;
    T_tcp_wrt_b = T_F_wrt_b*T_tcp_wrt_F;
    new_r = T_tcp_wrt_b(1:3,1:3);
    
    transformed_pt(i,:) = [T_tcp_wrt_b(1:3,4)',(rotm2eul(new_r).*(180/pi))];
end
end