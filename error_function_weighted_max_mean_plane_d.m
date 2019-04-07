function [Error] = error_function_weighted_max_mean_plane_d(x,input_part_ptcloud_icp,scan_traj,KDtree)

global w1 w2 neighbour_count;

tx = x(1);  ty = x(2);  tz = x(3);
q0 = x(4);  q1 = x(5);  q2 = x(6);  q3 = x(7);
transformation_matrix = [quat2rotm([q0 q1 q2 q3]),[tx;ty;tz];0 0 0 1];
transformed_data = apply_transformation(input_part_ptcloud_icp,transformation_matrix);

idx = knnsearch(KDtree,scan_traj,'K',neighbour_count);
d = zeros(size(scan_traj,1),1);

for i = 1:size(scan_traj,1)
    corresponding_val_from_part_ptcloud = transformed_data(idx(i,:),:);
    d(i) = get_pt_to_lsf_plane_dist(scan_traj(i,:),corresponding_val_from_part_ptcloud);
    if (isnan(d(i)))
        if i==1
            d(i) = 0;
        else
        d(i) = d(i-1);
        end
    end
    
end

% weighted max + mean of all distances
Error = (w1*sum(d)/size(d,1))+(w2*max(d));

end
