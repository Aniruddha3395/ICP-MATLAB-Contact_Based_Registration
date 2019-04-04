%% optimizer function:
% Optimize with Fmincon

function [transformation_matrix,fval,x] = optimize_with_fmincon(model_ptcloud,scan_ptcloud,tx,ty,tz,q0,q1,q2,q3,optm_method,error_fun)

global fval_chk;
global x0;
x = [tx,ty,tz,q0,q1,q2,q3];
% x0 = [0 0 0 1 0 0 0];
% lb = [-10 -10 -10 -1 -1 -1 -1];
% ub = [10 10 10 1 1 1 1];
ub = [];
lb = [];

fun = @(x)error_function(x,model_ptcloud,scan_ptcloud,optm_method,error_fun);
nonlcon = @inq_constaints;
options = optimoptions(@fmincon);
options.Display = 'none';
% options.MaxIterations = 200;
% options.UseParallel = true;
% options.StepTolerance = 1e-10;
% options.Algorithm = 'interior-point';
% options.DiffMaxChange = 1e-8;
options.FunctionTolerance = 1e-5;

[x,fval,~,output] = fmincon(fun,x0,[],[],[],[],lb,ub,nonlcon,options);



%%%%%%%%%%%%
% lb = [-20 -20 -20 -1 -1 -1 -1];
% ub = [20 20 20 1 1 1 1];
% 
% opts = optimoptions(@fmincon,'Algorithm','interior-point');
% problem = createOptimProblem('fmincon','objective',...
%     fun,'x0',x0,'lb',lb,'ub',ub,'options',options,'nonlcon',nonlcon);
% ms = MultiStart('UseParallel',true);
% gs = GlobalSearch(ms,'MaxTime',2);
% [x,fval] = run(gs,problem);

% if fval<fval_chk
% fval_chk = fval;
% end

% disp([fval, output.iterations]);



% 
% err1 = max(x_val - x0);
% while(fval>1)
%     % do some perturbabtion
%     x_curr = x_val;
%     x_val(1) = x_val(1)+(-40 + 80*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
%     % do some perturbabtion
%     x_curr = x_val;
%     x_val(2) = x_val(2)+(-40 + 80*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
%         % do some perturbabtion
%     x_curr = x_val;
%     x_val(3) = x_val(3)+(-40 + 80*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
%     % do some perturbabtion
%     x_curr = x_val;
%     x_val(4) = x_val(4)+(-0.05 + 0.1*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
%     % do some perturbabtion
%     x_curr = x_val;
%     x_val(5) = x_val(5)+(-0.05 + 0.1*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
%     % do some perturbabtion
%     x_curr = x_val;
%     x_val(6) = x_val(6)+(-0.05 + 0.1*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
%     % do some perturbabtion
%     x_curr = x_val;
%     x_val(7) = x_val(7)+(-0.05 + 0.1*rand(1));
%     [x_new,fval_new,~,output] = fmincon(fun,x_val,[],[],[],[],[],[],nonlcon,options);
%     disp([fval_new, output.iterations]);
%     if fval_new<fval
%         x_val = x_new;
%     else
%         x_val = x_curr;
%     end
% 
% end
%     


% for i = 1:10
%     fun = @(x)error_function(x,model_ptcloud,scan_ptcloud,optm_method,error_fun);
%     nonlcon = @inq_constaints;
%     options = optimoptions(@fmincon);
%     options.Display = 'none';
%     options.MaxIterations = 400;
%     options.StepTolerance = 1e-10;
%     options.Algorithm = 'interior-point';
%     options.DiffMaxChange = 1e-8;
%     options.FunctionTolerance = 1e-8;
%
%     [x,fval,~,output] = fmincon(fun,x0,[],[],[],[],[],[],nonlcon,options);
%     disp([fval, output.iterations]);
%     if fval>0.5
%         x(1) = x(1) + randi([-1,1],1,1)*1;
%         x(2) = x(2) + randi([-1,1],1,1)*1;
%         x(3) = x(3) + randi([-1,1],1,1)*1;
%         x(4) = x(4) + randi([-1,1],1,1)*0.001;
%         x(5) = x(5) + randi([-1,1],1,1)*0.001;
%         x(6) = x(6) + randi([-1,1],1,1)*0.001;
%         x(7) = x(7) + randi([-1,1],1,1)*0.001;
%         x0 = x;
%     else
%         break;
%     end
% end


% error_fun = 'mean_d';
% fun = @(x)error_function2(x,model_ptcloud,scan_ptcloud,optm_method,error_fun);
% nonlcon = @inq_constaints;
% options = optimoptions(@fmincon,'Display','iter');%,'Algorithm','interior-point','DiffMaxChange',1e-8,...
% %     'FunctionTolerance',1e-8,'StepTolerance',1e-10);
% [x,fval] = fmincon(fun,x0,[],[],[],[],[],[],nonlcon,options)
%
% x0 = x;
%
% error_fun = 'max_d';
% fun = @(x)error_function2(x,model_ptcloud,scan_ptcloud,optm_method,error_fun);
% nonlcon = @inq_constaints;
% options = optimoptions(@fmincon,'Display','iter');%,'Algorithm','interior-point','DiffMaxChange',1e-8,...
% %     'FunctionTolerance',1e-8,'StepTolerance',1e-10);
% [x,fval] = fmincon(fun,x0,[],[],[],[],[],[],nonlcon,options)

rotation_mat = quat2rotm([x(4) x(5) x(6) x(7)]);
translation_mat = [x(1);x(2);x(3)];
transformation_matrix = [rotation_mat,translation_mat;0 0 0 1];
transformed_data = apply_transformation(scan_ptcloud,transformation_matrix);
% hold on;
% scatter3d(transformed_data,'*');

    function [c,ceq] = inq_constaints(x)
%         c = fun(x)-fval_chk;
c= [];
        ceq = (x(4)^2)+(x(5)^2)+(x(6)^2)+(x(7)^2)-1;
    end
end



% [scan_ptcloud,corresponding_val_from_model_ptcloud] = correspondance_with_near_neighbour(KDtree,model_ptcloud,scan_ptcloud);
% [Error_prev,scan_ptcloud_transformed] = error_function(scan_ptcloud,corresponding_val_from_model_ptcloud,tx,ty,tz,rx,ry,rz);

% d_tx = -1;
% d_ty = -1;
% d_tz = -1;
% d_rx = -1;
% d_ry = -1;
% d_rz = -1;
% tx = tx+d_tx;
% ty = ty+d_ty;
% tz = tz+d_tz;
% rx = rx+d_rx;
% ry = ry+d_ry;
% rz = rz+d_rz;


% for i = 1:100
%     cla;
%     scatter3d(model_ptcloud,'.');
%     hold on;
%
%
%     [scan_ptcloud,corresponding_val_from_model_ptcloud] = correspondance_with_near_neighbour(KDtree,model_ptcloud,scan_ptcloud);
%     [Error_new,scan_ptcloud_transformed] = error_function(scan_ptcloud,corresponding_val_from_model_ptcloud,tx,ty,tz,rx,ry,rz);
%     Error_new
%     if Error_new<Error_prev
%         scan_ptcloud = scan_ptcloud_transformed;
%         tx = tx+d_ty;
%     end
%
%     hold on;
%     scatter3d(scan_ptcloud_transformed,'.');
%     pause(0.001);
% end

