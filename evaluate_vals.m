%% tests and geting complete transformation

global input_file_pts_from_kuka_scan;
global Complete_T;
global model_ptcloud_normals;
global tcp_publisher_pts_are_flange_pts;

[T_Final,pts,bx_transformed,by_transformed,bz_transformed] = ...
    apply_transformation_on_raw_scanned_pts(input_file_pts_from_kuka_scan,...
    Complete_T,model_ptcloud_normals,tcp_publisher_pts_are_flange_pts); 
disp(size(pts));