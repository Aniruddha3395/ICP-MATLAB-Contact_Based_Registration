clc;
clear;
close all;

%%%%%%%%%%%%   input   %%%%%%%%%%%%%
sample_stl_file_num_read ='2';
sample_csv_file_num_read ='21';
sample_csv_file_num_write ='3';


sampling_count = 100;
% sampling_pts = round(size(scan_ptcloud,1)/50);
sampling_pts = 5;

upper_bound_fact = 5;
lower_bound_fact = 0.1;

%%%%%%%%

apply_weightage = false;
random_sampling_required = false;
generate_data = false;

%%%%%%%%

if generate_data
    STL_file = strcat('sample_file_',sample_stl_file_num_read,'.stl');
    [model_ptcloud,scan_ptcloud] = generate_sample_data_for_icp_from_STL(STL_file);
    dlmwrite(strcat('sample_',sample_csv_file_num_write,'_model_ptcloud.csv'),model_ptcloud);
    dlmwrite(strcat('sample_',sample_csv_file_num_write,'_scan_ptcloud.csv'),scan_ptcloud);
else
    model_ptcloud_data = strcat('sample_',sample_csv_file_num_read,'_model_ptcloud.csv');
    scan_ptcloud_data = strcat('sample_',sample_csv_file_num_read,'_scan_ptcloud.csv');
    model_ptcloud = dlmread(model_ptcloud_data);
    scan_ptcloud = dlmread(scan_ptcloud_data);
end

% scatter3d(model_ptcloud,'.');
% hold on;
% scatter3d(scan_ptcloud,'.');

if random_sampling_required==true
    [scan_ptcloud_shifted,model_ptcloud] = random_sampling_for_initial_guess(model_ptcloud,scan_ptcloud,sampling_count,sampling_pts)
else
    scan_ptcloud_shifted = scan_ptcloud;
end

% Transform_mat = icp(scan_ptcloud_shifted,model_ptcloud);


%%%%%%trying something different!!!!!!


%icp with dktree knnsearch and svd

Error_val = [Inf, Inf, Inf];
Error_val_prev = [Inf, Inf, Inf];

threshold = 1;

start_scan_ptcloud = scan_ptcloud;

%make KDTree
KDtree = KDTreeSearcher(model_ptcloud);
Transform_mat_new = eye(4);
% while Error_val>threshold
for i = 1:100
    cla;
    scatter3d(model_ptcloud,'.')
    hold on;
    view(-67,49);
    scatter3(start_scan_ptcloud(:,1),start_scan_ptcloud(:,2),start_scan_ptcloud(:,3),'b','filled')
    
    [scan_ptcloud_modified,corresponding_val_from_model_ptcloud] = correspondance_with_near_neighbour_for_svd(KDtree,model_ptcloud,scan_ptcloud,apply_weightage,upper_bound_fact,lower_bound_fact);
    
    %get transformation matrix
    Transform_mat = SVD_scan_to_model(corresponding_val_from_model_ptcloud,scan_ptcloud_modified);
    Transform_mat_new = Transform_mat*Transform_mat_new;
    
    scan_ptcloud_transformed = [inv(Transform_mat)*[scan_ptcloud_modified';ones(1,size(scan_ptcloud_modified,1))]]';
    scan_ptcloud_transformed = scan_ptcloud_transformed(:,1:3);
    
    %Error function
    Error_val = ((sum((scan_ptcloud_transformed - corresponding_val_from_model_ptcloud).^2)))/size(scan_ptcloud_transformed,1);
    Error_val_diff = Error_val_prev-Error_val;
    Error_val_prev = Error_val;
    
    hold on;
    scatter3d(scan_ptcloud_transformed,'*');
    scan_ptcloud = scan_ptcloud_transformed;
    pause(0.001);
    
end
figure;
scatter3d(model_ptcloud,'.')
hold on;
scatter3d(scan_ptcloud_transformed,'*');
hold on;
scatter3d(start_scan_ptcloud,'.');

figure;
scatter3d(model_ptcloud,'.')
hold on;
scatter3d(start_scan_ptcloud,'.');
hold on;
scan_ptcloud2 = apply_transformation(start_scan_ptcloud,inv(Transform_mat_new));
scatter3d(scan_ptcloud2,'*');

Transform_mat_new


