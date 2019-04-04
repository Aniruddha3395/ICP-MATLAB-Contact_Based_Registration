clc
clear;
close all;

t_tcp_wrt_F = [0;0;106];
r_tcp_wrt_F = eul2rotm([0 0 0]);
T_tcp_wrt_F = [r_tcp_wrt_F,t_tcp_wrt_F;0 0 0 1];
 
t_F_wrt_b = [-30.784046551862097;496.80330496092876;822.7304027222051];
r_F_wrt_b = eul2rotm([-0.018137713626458836,0.0695329566066664,-2.2915707664079057]); 

T_F_wrt_b = [r_F_wrt_b,t_F_wrt_b;0 0 0 1] ;

T_tcp_wrt_b = T_F_wrt_b*T_tcp_wrt_F

new_r = T_tcp_wrt_b(1:3,1:3);
rotm2eul(new_r)*180/pi;



% apply_transformation(pts,T)

% a = [1 4 2;
%      4 7 2;
%      4 2 7];
% b = [3 7 8;
%      2 8 9;
%      5 9 1];
% 
% a - b
% cc = (a - b).^2
% 
% sqrt(sum(sum(cc)))
% 
% c = norm(a-b)
% 
% c1 = norm(a(1,:)-b(1,:))
% c2 = norm(a(2,:)-b(2,:))
% c3 = norm(a(3,:)-b(3,:))
% 
% sqrt(c1^2 + c2^2 + c3^2)
% 
% store =0;
% for i = 1:size(a,1)
%    dist = (a(i,1)-b(i,1))^2 + (a(i,2)-b(i,2))^2 + (a(i,3)-b(i,3))^2; 
%     store = store+dist;
% end
% d = sqrt(store)
% 
