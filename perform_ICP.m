function [ICP_transformation_matrix,fval,x] = perform_ICP(model_ptcloud,scan_ptcloud,optm_method,error_fun)

% scatter3d(model_ptcloud,'.');
hold on;
% scan_ptcloud = sequence_points(scan_ptcloud);
% scatter3d(scan_ptcloud,'.');
% plot3d(scan_ptcloud,'k');

syms tx ty tz rx ry rz q0 q1 q2 q3;

if optm_method=='use_fmincon'
    [ICP_transformation_matrix,fval,x] = optimize_with_fmincon(model_ptcloud,scan_ptcloud,tx,ty,tz,q0,q1,q2,q3,optm_method,error_fun);
elseif optm_method=='use_fminunc'
    [ICP_transformation_matrix,fval] = optimize_with_fminunc(model_ptcloud,scan_ptcloud,tx,ty,tz,rx,ry,rz,optm_method,error_fun);
elseif optm_method=='use_sa'
    [ICP_transformation_matrix,fval] = optimize_with_sa(model_ptcloud,scan_ptcloud,tx,ty,tz,rx,ry,rz,optm_method,error_fun);
else
    disp('no such method')
end
end