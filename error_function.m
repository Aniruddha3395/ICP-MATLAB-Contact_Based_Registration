%% Error Function:
% Includes 4 variants of error: sum(all_distances), mean(all_distances), rms(all_distances) and max(all_distances)

function [Error,scan_ptcloud] = error_function(x,model_ptcloud,scan_ptcloud,optm_method,error_fun)
global KDtree;

if optm_method == 'use_fmincon'
    tx = x(1);  ty = x(2);  tz = x(3);
    q0 = x(4);  q1 = x(5);  q2 = x(6);  q3 = x(7);
    rotation_mat = quat2rotm([q0 q1 q2 q3]);
    
elseif optm_method == 'use_fminunc'
    tx = x(1);  ty = x(2);  tz = x(3);
    rx = x(4);  ry = x(5);  rz = x(6);
    rotation_mat = eul2rotm([rz,ry,rx]);
    
end

% KNN search over KD Tree
num_of_neighbours = 1;
idx = knnsearch(KDtree,scan_ptcloud,'K',num_of_neighbours);
corresponding_val_from_model_ptcloud = model_ptcloud(idx,:);

translation_mat = [tx;ty;tz];
transformation_matrix = [rotation_mat,translation_mat;0 0 0 1];
transformed_data = apply_transformation(scan_ptcloud,transformation_matrix);

switch error_fun
    case 'abs_d'
        Error = sum(sum(abs(corresponding_val_from_model_ptcloud-transformed_data)));
    case 'sum_d'
        % sum of all distances
        Error = sum(dist(corresponding_val_from_model_ptcloud,transformed_data));
    case 'max_d'
        % maximum of all distances
        Error = max(dist(corresponding_val_from_model_ptcloud,transformed_data));
    case 'mean_d'
        % mean of all distances
        Error = sum(dist(corresponding_val_from_model_ptcloud,transformed_data))/size(transformed_data,1);
    case 'rms_d'
        % rms of all distances
        Error = sqrt(sum(dist(corresponding_val_from_model_ptcloud,transformed_data).^2)/size(transformed_data,1));
end
end
