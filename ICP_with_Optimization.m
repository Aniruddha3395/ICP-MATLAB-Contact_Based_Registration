% world frame is robot base frame
clc;
clear;
close all;
dbstop if error;
set(0, 'DefaultFigureRenderer', 'opengl');
total_time = tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run global_CONFIG.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Perform ICP
%start T: given by some scanner i.e. input w_T_p
%start seed for icp: eye(4);
type = 'mean_plane_d';
Error_threshold = 0.05;
perturb_val = 0.6;
input_w_T_p  = all_input_w_T_p(1);
run perform_ICP.m 
% output 
run show_results.m
toc(total_time);

% if wanted to execute some trajectory with final transformation:
%%%%%%%%%%%
% run compute_traj_wrt_robot_base.m
%%%%%%%%%%%

