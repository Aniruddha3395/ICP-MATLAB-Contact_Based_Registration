global icp_dir data_file_dir;

figure;
input_traj = dlmread(strcat(icp_dir,'ICP_new/data_files/bdry_pts.csv'));
part_ptcloud = dlmread(strcat(icp_dir,data_file_dir,'part_ptcloud.csv'));
model_ptcloud_normals = dlmread(strcat(icp_dir,data_file_dir,'part_ptcloud_normals.csv'));

% getting correspondance over transfrmed pts for normal info
num_of_neighbours = 1;
KDtree = KDTreeSearcher(part_ptcloud);

idx = knnsearch(KDtree,input_traj,'K',num_of_neighbours);
corresponding_val_from_model_ptcloud_normals = model_ptcloud_normals(idx,:);

corresponding_val_from_model_ptcloud_normals = zeros(size(corresponding_val_from_model_ptcloud_normals,1),3) + [0 0 1];
[bx,by,bz] = compute_TCP_new(input_traj,corresponding_val_from_model_ptcloud_normals);
scatter3d(input_traj,'*r');
plot_tcp(input_traj,bx,by,bz);
hold on;

% Transform pts and TCP orientation data from part frame to robot frame
T_Final = Final_w_T_p;
pts = apply_transformation(input_traj,T_Final);
scatter3d(pts,'*')

bx_transformed = bx';
bx_transformed = T_Final(1:3,1:3) * bx_transformed;
bx_transformed = bx_transformed';

by_transformed = by';
by_transformed = T_Final(1:3,1:3) * by_transformed;
by_transformed = by_transformed';

bz_transformed = bz';
bz_transformed = T_Final(1:3,1:3) * bz_transformed;
bz_transformed = bz_transformed';

scatter3d(pts,'filled');
plot_tcp(pts,bx_transformed,by_transformed,bz_transformed);

%output with respect to robot base and also with respect to TCP
pts(:,1:3) = pts(:,1:3)./1000;      %making mm to meters

dlmwrite(strcat(icp_dir,data_file_dir,'test_traj.csv'),[pts,bx_transformed,by_transformed,bz_transformed]);
disp('file test_data.csv saved in the main directory!')