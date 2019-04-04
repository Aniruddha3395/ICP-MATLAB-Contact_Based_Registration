clc;
clear;
close all;
dbstop if error;
set(0, 'DefaultFigureRenderer', 'opengl');

global Seed_T True_Seed_T Complete_T KDtree;
global tcp_publisher_pts_are_flange_pts;
global fval_chk;
global x0;
global pts_from_tcp_publisher_wrt_tcp;

run declarations.m

KDtree = KDTreeSearcher(model_ptcloud);
scan_ptcloud_start = get_seed_for_icp(tcp_publisher_pts_are_flange_pts,true);

%% decision of selcting the sedd after pertubation....error metric is fval jump

small_val = 1;
big_val = 10;
fval_curr = Inf;
fval_prev = Inf;
fval_chk = 1000;
x0 = [0 0 0 1 0 0 0];
fval_curr_lim = 0.5;
tol = 0.001;

Start_timer = tic;
while fval_curr>fval_curr_lim
    % for i = 1:1
    cla;
    scan_ptcloud = get_seed_for_icp(tcp_publisher_pts_are_flange_pts,false);
    [ICP_transformation_matrix,fval_new,x] = perform_ICP(model_ptcloud,scan_ptcloud,optm_method,error_fun);
    
    if abs(fval_new - fval_prev)>tol
        fval_prev = fval_new;
        perturb_val_t = -small_val + 2*small_val*rand(1,3);
        x0(1,1:3) = x(1,1:3) + perturb_val_t;
        perturb_val_r = [-0.5*small_val + small_val*rand(1,3)].*(pi/180);
        x0(1,4:7) = eul2quat(quat2eul(x(1,4:7))+perturb_val_r);
        x0(1,1:3) = x(1,1:3);
        x0(1,4:7) = x(1,4:7);
        if T_part_wrt_base_for_seed
            Complete_T = ICP_transformation_matrix*inv(Seed_T);
        else
            Complete_T = ICP_transformation_matrix*Seed_T;
        end
        Seed_T = inv(Complete_T);
    else
        if fval_curr>fval_new
            fval_curr = fval_new;
            if T_part_wrt_base_for_seed
                Store_Complete_T= ICP_transformation_matrix*inv(Seed_T);
            else
                Store_Complete_T = ICP_transformation_matrix*Seed_T;
            end
        end
        scan_ptcloud = scan_ptcloud_start;
        x0 = [0 0 0 1 0 0 0];
        perturb_val_t = -big_val + 2*big_val*rand(3,1);
        Seed_t_new = Seed_T(1:3,4) + perturb_val_t;
        perturb_val_r = [-0.5*big_val + big_val*rand(1,3)].*(pi/180);
        Seed_r_new = eul2rotm([rotm2eul(Seed_T(1:3,1:3)) + perturb_val_r]);
        Seed_T = [Seed_r_new,Seed_t_new;0 0 0 1];
    end
    [fval_curr,  fval_new]
    if toc(Start_timer)>120
        break;
    end
end

if fval_curr==Inf
    fval_curr = fval_new;
    if T_part_wrt_base_for_seed
        Store_Complete_T= ICP_transformation_matrix*inv(Seed_T);
    else
        Store_Complete_T = ICP_transformation_matrix*Seed_T;
    end
end

% if T_part_wrt_base_for_seed
%     Complete_T = ICP_transformation_matrix*inv(Seed_T);
% else
%     Complete_T = ICP_transformation_matrix*Seed_T;
% end
Final_T = inv(Store_Complete_T);
Final_T

figure;
scatter3d(model_ptcloud,'.');
hold on;
scatter3d(scan_ptcloud_start,'.');
final_pts = apply_transformation(pts_from_tcp_publisher_wrt_tcp,Complete_T);
hold on;
scatter3d(final_pts,'filled');












%% decision of selcting the sedd after pertubation....error metric is fval jump
%
% Store_Complete_fval{1,1} = Inf;Store_Complete_fval{2,1} = Inf;Store_Complete_fval{3,1} = Inf;
% Store_Complete_T = {};
%
% for i_cell = 1:3
% i_cell
% small_val = 2;
% big_val = 15;
% fval_curr = Inf;
% fval_prev = Inf;
% fval_chk = 1000;
% x0 = [0 0 0 1 0 0 0];
% fval_curr_lim = 1;
% tol = 0.001;
%
% Seed_T = True_Seed_T;
% Start_timer = tic;
% while fval_curr>fval_curr_lim
%     %     for i = 1:50
%     cla;
%     scan_ptcloud = get_seed_for_icp(tcp_publisher_pts_are_flange_pts,false);
%     [ICP_transformation_matrix,fval_new,x] = perform_ICP(model_ptcloud,scan_ptcloud,optm_method,error_fun);
%
%     if abs(fval_new - fval_prev)>tol
%         if fval_prev>fval_new
%             fval_prev = fval_new;
%         end
%         x0(1,1:3) = x(1,1:3);
%
%         x0(1,4:7) = x(1,4:7);
%
%         if T_part_wrt_base_for_seed
%             Complete_T = ICP_transformation_matrix*inv(Seed_T);
%         else
%             Complete_T = ICP_transformation_matrix*Seed_T;
%         end
%         Seed_T = inv(Complete_T);
%     else
%         if fval_curr>fval_new
%             fval_curr = fval_new;
%             if T_part_wrt_base_for_seed
%                 Store_Complete_fval{i_cell,1} = fval_curr;
%                 Store_Complete_T{i_cell,1} = ICP_transformation_matrix*inv(Seed_T);
%             else
%                 Store_Complete_fval{i_cell,1} = fval_curr;
%                 Store_Complete_T{i_cell,1} = ICP_transformation_matrix*Seed_T;
%             end
%         end
%         if abs(fval_prev-fval_new)<tol
%             perturb_val_t = -small_val + 2*small_val*rand(1,3);
%             x0(1,1:3) = x(1,1:3) + perturb_val_t;
%             perturb_val_r = [-0.5*small_val + small_val*rand(1,3)].*(pi/180);
%             x0(1,4:7) = eul2quat(quat2eul(x(1,4:7))+perturb_val_r);
%         end
%         x0 = [0 0 0 1 0 0 0];
%         perturb_val_t = -big_val + 2*big_val*rand(3,1);
%         Seed_t_new = Seed_T(1:3,4) + perturb_val_t;
%         perturb_val_r = [-0.5*big_val + big_val*rand(1,3)].*(pi/180);
%         Seed_r_new = eul2rotm([rotm2eul(Seed_T(1:3,1:3)) + perturb_val_r]);
%         Seed_T = [Seed_r_new,Seed_t_new;0 0 0 1];
%     end
%     [fval_curr,  fval_new]
%     if toc(Start_timer)>120
%         break;
%     end
% end
%
% if fval_curr<1
%     break;
% end
%
% end
%
% chk = cell2mat(Store_Complete_fval);
%
% Store_Complete_T1 = Store_Complete_T{find(chk==min(chk)),1};
%
% % if T_part_wrt_base_for_seed
% %     Complete_T = ICP_transformation_matrix*inv(Seed_T);
% % else
% %     Complete_T = ICP_transformation_matrix*Seed_T;
% % end
% Final_T = inv(Store_Complete_T1);
% Final_T
%
% % figure;
% scatter3d(model_ptcloud,'.');
% hold on;
% scatter3d(scan_ptcloud_start,'.');
% final_pts = apply_transformation(pts_from_tcp_publisher_wrt_tcp,Complete_T);
% hold on;
% scatter3d(final_pts,'filled');





%% decision of selcting the sedd after pertubation....error metric is sumt^2 and sumr^2
%
% E_t_curr = Inf;
% E_r_curr = Inf;
%
% for i = 1:5
% cla;
%
% perturb_val_t = -10 + 20*rand(3,1);
% Seed_t = Seed_t + perturb_val_t;
% perturb_val_r = [-5 + 10*rand(1,3)].*(pi/180);
% Seed_r = eul2rotm([rotm2eul(Seed_r) + perturb_val_r]);
% Seed_T = [Seed_r,Seed_t;0 0 0 1];
%
% scan_ptcloud = get_seed_for_icp(tcp_publisher_pts_are_flange_pts);
% [ICP_transformation_matrix] = perform_ICP(model_ptcloud,scan_ptcloud,optm_method,error_fun);
% if T_part_wrt_base_for_seed
%     Complete_T = ICP_transformation_matrix*inv(Seed_T);
% else
%     Complete_T = ICP_transformation_matrix*Seed_T;
% end
% Final_T = inv(Complete_T);
%
% E_t_new = sum( [True_T(1:3,4) - Final_T(1:3,4)].^2 );
% E_r_new = sum( sum( [True_T(1:3,1:3) - Final_T(1:3,1:3)].^2) );
%
% if E_t_new<E_t_curr
%     E_t_curr = E_t_new;
%     Seed_t = Final_T(1:3,4);
% end
%
%
% if E_r_new<E_r_curr
%     E_r_curr = E_r_new;
%     Seed_r = Final_T(1:3,1:3);
% end
%
% end

%    [ 1.0000   -0.0036   -0.0060  475.9318
%     0.0035    1.0000   -0.0055 -145.9004
%     0.0060    0.0055    1.0000  310.7967
%          0         0         0    1.0000]


%% only checking if after error after perturbation is less than tol or not
% not decision of when to stop or what to select othewise

% t_safe = false;
% r_safe = false;
% while t_safe~=true && r_safe~=true
% %     for i = 1:1
%     cla;
%     scan_ptcloud = get_seed_for_icp(tcp_publisher_pts_are_flange_pts);
%     [ICP_transformation_matrix] = perform_ICP(model_ptcloud,scan_ptcloud,optm_method,error_fun);
%
%     if T_part_wrt_base_for_seed
%         Complete_T = ICP_transformation_matrix*inv(Seed_T);
%     else
%         Complete_T = ICP_transformation_matrix*Seed_T;
%     end
%     Final_T = inv(Complete_T);
%
%     E = (True_T - Final_T)
%     if sum(E(1:3,4).^2)>0.5
%         t_safe=false;
%         perturb_val_t = -10 + 20*rand(3,1);
%         Seed_t = True_t + perturb_val_t;
%     else
%         t_safe=true;
%     end
%
%     if sum(sum(E(1:3,1:3).^2))>1e-6
%         r_safe=false;
%         perturb_val_r = [-5 + 10*rand(1,3)].*(pi/180);
%         Seed_r = eul2rotm([rotm2eul(True_r) + perturb_val_r]);
%     else
%         r_safe=true;
%     end
%     Seed_T = [Seed_r,Seed_t;0 0 0 1];
%
% end
%




% %% ICP
%
% figure;
% KDtree = KDTreeSearcher(model_ptcloud);
% [ICP_transformation_matrix] = perform_ICP(model_ptcloud,scan_ptcloud,optm_method,error_fun);
%
% %% final transformation matrix from part frame to robot base frame
%
% if T_part_wrt_base_for_seed
%     Complete_T = ICP_transformation_matrix*inv(Seed_T);
% else
%     Complete_T = ICP_transformation_matrix*Seed_T;
% end
% Final_T = inv(Complete_T);















%% tests and geting complete transformation

% input_file_pts_from_kuka_scan = true;
% input_file = raw_scanned_pts_file_name;

% run evaluate_vals.m

% profile viewer;