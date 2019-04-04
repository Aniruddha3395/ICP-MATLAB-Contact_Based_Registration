% world frame is robot base frame
clc;
global data_set_num;

for data_set_num = 1:13
    switch data_set_num
        case 1
             num_val_low = 1;
             num_val_high = 13;
        case 2
             num_val_low = 14;
             num_val_high = 17;
        case 3
             num_val_low = 14;
             num_val_high = 17;
        case 4
             num_val_low = 18;
             num_val_high = 22;
        case 5
             num_val_low =23;
             num_val_high = 27;
        case 6
             num_val_low = 28;
             num_val_high = 32;
        case 7
             num_val_low = 33;
             num_val_high = 37;
        case 8
             num_val_low = 38;
             num_val_high = 42;
        case 9
             num_val_low = 43;
             num_val_high = 47;
        case 10
             num_val_low = 48;
             num_val_high = 52;
        case 11
             num_val_low = 53;
             num_val_high = 57;
        case 12
             num_val_low = 58;
             num_val_high = 62;
        case 13
             num_val_low = 63;
             num_val_high = 67;             
    end
for num_val = num_val_low:num_val_high
for file_rep = 1:2
disp([data_set_num,num_val,file_rep]);
clearvars -except file_rep num_val;
close all;
dbstop if error;
set(0, 'DefaultFigureRenderer', 'opengl');
total_time = tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run delete5.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Perform ICP
%start T: given by some scanner i.e. input w_T_p
%start seed for icp: eye(4);
type = 'weighted_max_mean_plane_d';
Error_threshold = 0.06;
perturb_val = 0.5;
input_w_T_p  = all_input_w_T_p(num_val);
file_name = strcat('solution_T_',num2str(num_val),'.txt');
% file_name = strcat('solution_T_',num2str(num_val),'_',num2str(file_rep),'.txt');
write_results = true;
run perform_ICP.m 
% output 
run show_results.m
toc(total_time);

%write results into file:
if write_results
file_write = fopen(file_name,'a');
fprintf(file_write,'max_d = %f mm\n\nmax_plane_d = %f mm\n\nmean_d = %f mm\n\nmean_plane_d = %f mm\n\nweighted_max_mean_d = %f mm\n\n',Error_max_d,Error_max_plane_d,Error_mean_d,Error_mean_plane_d,Error_weighted_max_mean_d);
fprintf(file_write,'Final_w_T_p = \n');
fprintf(file_write,'%f\t%f\t%f\t%f\n',Final_w_T_p(1,1),Final_w_T_p(1,2),Final_w_T_p(1,3),Final_w_T_p(1,4));
fprintf(file_write,'%f\t%f\t%f\t%f\n',Final_w_T_p(2,1),Final_w_T_p(2,2),Final_w_T_p(2,3),Final_w_T_p(2,4));
fprintf(file_write,'%f\t%f\t%f\t%f\n',Final_w_T_p(3,1),Final_w_T_p(3,2),Final_w_T_p(3,3),Final_w_T_p(3,4));
fprintf(file_write,'%f\t%f\t%f\t%f\n\n',Final_w_T_p(4,1),Final_w_T_p(4,2),Final_w_T_p(4,3),Final_w_T_p(4,4));
fclose(file_write);
end

end
end
end
% if wanted to execute some trajectory with final transformation:
%%%%%%%%%%%
% run compute_traj_wrt_robot_base.m
%%%%%%%%%%%

