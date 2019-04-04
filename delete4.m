clc;
clear;
close all;

xyz_pts1 = dlmread('xyz_val_pt1.csv');
xyz_pts2 = dlmread('xyz_val_pt2.csv');

scatter3(xyz_pts1(:,1),xyz_pts1(:,2),xyz_pts1(:,3),'.')
hold on;
scatter3(xyz_pts2(:,1),xyz_pts2(:,2),xyz_pts2(:,3),'.')
xlabel('x');ylabel('y');zlabel('z');
hold on;
[v_part, f_part, n_part, stltitle_part] = stlRead('DOME_0930.stl');
col_matrix = [0.941176, 0.972549, 1];
col_matrix_part = [0.8,0.8,0.8];
col_matrix2_part = [0.3,0.3,0.3];
patch('Faces',f_part,'Vertices',v_part,'FaceVertexCData',col_matrix_part,'FaceColor',col_matrix_part,'EdgeColor','none','FaceAlpha',0.7);
daspect([1,1,1]);

hold on;
scatter3(149.4,505.03,83.93,'k','filled');
view(90,90);


% first_name = 'pt2';
% middle = '_first_column';
% ext = '.csv';
% read_pts_from_csvs(first_name,middle,ext)

function[] = read_pts_from_csvs(first_name,middle,ext)

filename = strcat(first_name,middle,ext);
fileID = fopen(filename);
scanned_text = textscan(fileID,'%s %f');
fclose(fileID);
x_val = scanned_text{1,2};

middle = '_rest_columns';
filename = strcat(first_name,middle,ext);
yzijk_val = dlmread(filename);
yz_val = yzijk_val(:,1:2);
xyz_val = [x_val,yz_val];
dlmwrite(strcat('xyz_val_',first_name,'.csv'),xyz_val);
end