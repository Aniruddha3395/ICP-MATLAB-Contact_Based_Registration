global w_T_part;
global raw_scan_pts_wrt_tcp;

part_ptcloud= dlmread('part_ptcloud.csv');
part_ptcloud = part_ptcloud./1000;
transformed_data = apply_transformation(part_ptcloud,w_T_part);

% KNN search over KD Tree
KDtree = KDTreeSearcher(transformed_data);
num_of_neighbours = 1;
idx = knnsearch(KDtree,raw_scan_pts_wrt_tcp,'K',num_of_neighbours);
corresponding_val_from_model_ptcloud = transformed_data(idx,:);
Error_max_d = max(dist(corresponding_val_from_model_ptcloud,raw_scan_pts_wrt_tcp));
Error_mean_d = sum(dist(corresponding_val_from_model_ptcloud,raw_scan_pts_wrt_tcp))/size(raw_scan_pts_wrt_tcp,1);
disp([Error_max_d*1000,Error_mean_d*1000]);
