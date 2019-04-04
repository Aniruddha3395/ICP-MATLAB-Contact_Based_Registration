function [Error] = error_function_weighted_max_mean_plane_d(x,input_part_ptcloud_icp,scan_traj,KDtree)

tx = x(1);  ty = x(2);  tz = x(3);
q0 = x(4);  q1 = x(5);  q2 = x(6);  q3 = x(7);
        
rotation_mat = quat2rotm([q0 q1 q2 q3]);
translation_mat = [tx;ty;tz];
transformation_matrix = [rotation_mat,translation_mat;0 0 0 1];
transformed_data = apply_transformation(input_part_ptcloud_icp,transformation_matrix);

idx = knnsearch(KDtree,scan_traj,'K',5);
d = zeros(size(scan_traj,1),1);
for i = 1:size(scan_traj,1)
corresponding_val_from_part_ptcloud = transformed_data(idx(i,:),:);
d(i) = get_pt_to_lsf_plane_dist(scan_traj(i,:),corresponding_val_from_part_ptcloud);
end


% weighted max + mean of all distances
Error = (0.75*sum(d)/size(d,1))+(0.25*max(d));
end
