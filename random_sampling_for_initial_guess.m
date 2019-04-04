function [store_transformed_data,model_ptcloud] = random_sampling_for_initial_guess(model_ptcloud,scan_ptcloud,sampling_count,sampling_pts)
%%%%%%%% random sampling %%%%%%%%%%


Error = Inf;

KDtree = KDTreeSearcher(model_ptcloud);
for i = 1:sampling_count
    cla;
    scatter3d(model_ptcloud,'.');
    hold on;
    scatter3d(scan_ptcloud,'.');
    
    model_ptcloud_sample = datasample(model_ptcloud,sampling_pts,'Replace',false);
    scan_ptcloud_sample = datasample(scan_ptcloud,sampling_pts,'Replace',false);
    
    T = SVD_scan_to_model(model_ptcloud_sample,scan_ptcloud_sample);
    transformed_data = apply_transformation(scan_ptcloud,T);
    %     transformed_data = apply_transformation(scan_ptcloud_sample,T);
    
    
    
    %do knnsearch and get error
    
    [scan_ptcloud_mod,corresponding_val] = correspondance_with_near_neighbour(KDtree,model_ptcloud,transformed_data);
    Error_new = (sum(sum((scan_ptcloud_mod - corresponding_val).^2)))/size(scan_ptcloud_mod,1);
    %     Error_new = (sum(sum((transformed_data - model_ptcloud_sample).^2)))/size(transformed_data,1);
    
    if Error_new<Error
        Error = Error_new;
        transformed_data_complete = apply_transformation(scan_ptcloud,T);
        
        store_transformed_data = transformed_data_complete;
    end
    hold on;
    scatter3d(store_transformed_data,'.');
    pause(0.001)
    
end
end