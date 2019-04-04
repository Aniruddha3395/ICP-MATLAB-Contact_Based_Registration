%% optimizer function: 
% Optimize with Fminunc

function [transformation_matrix,fval] = optimize_with_sa(model_ptcloud,scan_ptcloud,tx,ty,tz,rx,ry,rz,optm_method,error_fun)

global KDtree;

x = [tx,ty,tz,rx,ry,rz];
x0 = [0 0 0 0 0 0];

fun = @(x)error_function(x,model_ptcloud,scan_ptcloud,optm_method,error_fun);

options = optimoptions(@simulannealbnd);
options.AcceptanceFcn = 'acceptancesa';
options.FunctionTolerance = 1e-3;
[x,fval,~,output] = simulannealbnd(fun,x0,[],[],options);


rotation_mat = eul2rotm([x(6), x(5), x(4)]);
translation_mat = [x(1);x(2);x(3)];

transformation_matrix = [rotation_mat,translation_mat;0 0 0 1];
transformed_data = apply_transformation(scan_ptcloud,transformation_matrix);

hold on;
scatter3d(transformed_data,'*');

end