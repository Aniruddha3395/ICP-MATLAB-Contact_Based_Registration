function [Error] = error_function_max_d(x,input_part_ptcloud_icp,scan_traj,KDtree)

tx = x(1);  ty = x(2);  tz = x(3);
q0 = x(4);  q1 = x(5);  q2 = x(6);  q3 = x(7);

idx = knnsearch(KDtree,scan_traj,'K',1);
corresponding_val_from_part_ptcloud = input_part_ptcloud_icp(idx,:);
        
rotation_mat = quat2rotm([q0 q1 q2 q3]);
translation_mat = [tx;ty;tz];
transformation_matrix = [rotation_mat,translation_mat;0 0 0 1];
transformed_data = apply_transformation(corresponding_val_from_part_ptcloud,transformation_matrix);

% max of all distances
Error = max(dist(scan_traj,transformed_data));
end
