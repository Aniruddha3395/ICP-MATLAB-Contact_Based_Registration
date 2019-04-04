% clc;
clear;
close all;

True_w_T_p = [
    1.0000   -0.0001    0.0002  477.4196
    0.0001    1.0000    0.0014 -143.6004
    -0.0003   -0.0014    1.0000  311.3996
    0         0         0    1.0000
    ];
part_ptcloud = dlmread('part_ptcloud.csv');
transformed_ptcloud = apply_transformation(part_ptcloud,True_w_T_p);
KDtree = KDTreeSearcher(transformed_ptcloud);
scan_traj = dlmread('scanned_traj.csv');

p = scan_traj(1:2,:);
idx = knnsearch(KDtree,p,'K',5)
corresponding_val_from_part_ptcloud = transformed_ptcloud(idx,:)

for i = 1:size(p,1)
corresponding_val_from_part_ptcloud = transformed_ptcloud(idx(i,:),:)
d = get_pt_to_lsf_plane_dist(p(i,:),corresponding_val_from_part_ptcloud)
end
    

    