fprintf('ICP Started....\n\n');
global x0;
input_part_ptcloud_icp = apply_transformation(part_ptcloud,input_w_T_p);
fval_curr = Inf;
input_part_ptcloud_icp_true = input_part_ptcloud_icp;
icp_T_final = eye(4);
x0 = [0 0 0 1 0 0 0];
timer_start = tic;
while fval_curr>Error_threshold
    % for i = 1:3
    syms tx ty tz q0 q1 q2 q3;
    [icp_T,x,fval] = perform_fmincon(input_part_ptcloud_icp,scan_traj,tx,ty,tz,q0,q1,q2,q3,type);
    if fval<fval_curr
        fval_curr=fval;
        x0 = x;
        icp_T_final = icp_T*icp_T_final;
        input_part_ptcloud_icp = apply_transformation(input_part_ptcloud_icp,icp_T);
        icp_T_final_save = icp_T_final;
        input_part_ptcloud_icp_save = input_part_ptcloud_icp;
    else
        x0 = [0 0 0 1 0 0 0];
        perturb_val_t = -perturb_val + 2*perturb_val*rand(3,1);
        icp_t = icp_T(1:3,4) + perturb_val_t;
        perturb_val_r = [-0.5*perturb_val + 1*perturb_val*rand(1,3)].*(pi/180);
        icp_r = eul2rotm([rotm2eul(icp_T(1:3,1:3)) + perturb_val_r]);
        icp_T = [icp_r,icp_t;0 0 0 1];
        icp_T_final = icp_T*icp_T_final;
        input_part_ptcloud_icp = apply_transformation(input_part_ptcloud_icp,icp_T);
    end
    disp([fval_curr,fval]);
    if toc(timer_start)>200
        break;
    end
end