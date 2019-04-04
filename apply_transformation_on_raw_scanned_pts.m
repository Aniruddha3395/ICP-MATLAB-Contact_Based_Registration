function [T_Final,pts,bx_transformed,by_transformed,bz_transformed] = apply_transformation_on_raw_scanned_pts(input_file_pts_from_kuka_scan,Complete_T,model_ptcloud_normals,tcp_publisher_pts_are_flange_pts)

global input_file;
global main_dir;
global tool_T;
global stl_name;
global output_file;
global output_file_path;
global KDtree;


% used for applying transformation on the pts scanned by robot or pts elected over the model surface
input_file_pts = dlmread(input_file);

if input_file_pts_from_kuka_scan
    pts_from_tcp_publisher_wrt_tcp =  get_pts_from_scan(input_file_pts,tool_T,tcp_publisher_pts_are_flange_pts);
    view_stl(stl_name,[],[],0.3,[]);
    hold on;
    scatter3d(pts_from_tcp_publisher_wrt_tcp,'.');
    hold on;
    transformed_pts = apply_transformation(pts_from_tcp_publisher_wrt_tcp(:,1:3),Complete_T);
    scatter3d(transformed_pts,'.');
else
    transformed_pts = input_file_pts(:,1:3);
    scatter3d(transformed_pts,'.');
    hold on;
end

% getting correspondance over transfrmed pts for normal info
num_of_neighbours = 1;
idx = knnsearch(KDtree,transformed_pts,'K',num_of_neighbours);
corresponding_val_from_model_ptcloud_normals = model_ptcloud_normals(idx,:);

corresponding_val_from_model_ptcloud_normals = zeros(size(corresponding_val_from_model_ptcloud_normals,1),3) + [0 0 1];
[bx,by,bz] = compute_TCP_new(transformed_pts,corresponding_val_from_model_ptcloud_normals);
scatter3d(transformed_pts,'filled');
plot_tcp(transformed_pts,bx,by,bz);
hold on;

% Transform pts and TCP orientation data from part frame to robot frame
[T_Final,pts,bx_transformed,by_transformed,bz_transformed] = robot_trajectory(Complete_T,transformed_pts,bx,by,bz,main_dir,output_file,output_file_path);
disp('file test_data.csv saved in the main directory!')

end
