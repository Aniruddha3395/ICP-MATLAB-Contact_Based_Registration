%% SHOW OUTPUT

%icp_T is transformation of part wrt scan
Final_w_T_p = icp_T_final_save*input_w_T_p;
hold on;
%plotting robot base
scatter3(0,0,0,100,'d','filled','r');
hold on;
quiver3(0,0,0,1,0,0,100,'r');hold on;quiver3(0,0,0,0,1,0,100,'g');hold on;quiver3(0,0,0,0,0,1,100,'b');
hold on;
%plotting scan traj
scatter3d(scan_traj,'filled');

% transformed_ptcloud = apply_transformation(input_part_ptcloud_icp_true,eye(4));
% hold on;
% scatter3d(transformed_ptcloud,'r.');
% transformed_ptcloud = apply_transformation(input_part_ptcloud_icp,icp_T);
% hold on;
% scatter3d(transformed_ptcloud,'b.');

transformed_ptcloud = apply_transformation(part_ptcloud,Final_w_T_p);
hold on;
scatter3d(transformed_ptcloud,'g.');

KDtree = KDTreeSearcher(transformed_ptcloud);
num_of_neighbours = 1;
idx = knnsearch(KDtree,scan_traj,'K',num_of_neighbours);
corresponding_val_from_part_ptcloud = transformed_ptcloud(idx,:);
Error_max_d = max(dist(corresponding_val_from_part_ptcloud,scan_traj));
Error_mean_d = sum(dist(corresponding_val_from_part_ptcloud,scan_traj))/size(scan_traj,1);
Error_weighted_max_mean_d = 0.25*Error_max_d+0.75*Error_mean_d;

idx = knnsearch(KDtree,scan_traj,'K',5);
d = zeros(size(scan_traj,1),1);
for i = 1:size(scan_traj,1)
corresponding_val_from_part_ptcloud = transformed_ptcloud(idx(i,:),:);
d(i) = get_pt_to_lsf_plane_dist(scan_traj(i,:),corresponding_val_from_part_ptcloud);
end
Error_mean_plane_d = sum(d)/size(d,1);
Error_max_plane_d = max(d);

fprintf('max_d :%f,\n max_plane_d :%f,\n mean_d :%f,\n mean_plane_d :%f,\n weighted_max_mean_d :%f\n',Error_max_d,Error_max_plane_d,Error_mean_d,Error_mean_plane_d,Error_weighted_max_mean_d);
disp(Final_w_T_p);
