% profile on;
clc;
clear;
close all;
dbstop if error;
total_time = tic;
global time_threshold;
global x0;
global w1 w2;
global neighbour_count;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%info on data regarding ICP initailization
run global_CONFIG.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ICP parameters
%start seed for icp: eye(4)
x0 = [0 0 0 1 0 0 0];
%error function termination tolerence
Error_threshold = 0.05;     %mm
%disturbance in seed 
perturb_val = 0.6;          %mm
%termination through time limit
time_threshold = 60;        %sec
%weights for error function
w1 = 0.75;w2 = 0.25;
%neighbour count for least square plane fitting
neighbour_count = 5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ICP... 
run perform_ICP.m 
Final_w_T_p = icp_T_final_save*input_w_T_p
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% show output error function value and other values after ICP 
% run show_results.m

% if wanted to execute some trajectory with final transformation:
%%%%%%%%%%%
% run compute_traj_wrt_robot_base.m
%%%%%%%%%%%
% profile viewer;
