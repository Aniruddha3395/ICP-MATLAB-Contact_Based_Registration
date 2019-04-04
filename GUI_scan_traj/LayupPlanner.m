clear
clc
close all
dbstop if error;

%% Define part and Plot it
% 
% part_dir = '/home/rflin/Desktop/ICP/CADandSTL/car_bonnet/';
% part = 'sample_file_8_car_bonnet.STL';
% output_file_dir = '/home/rflin/Desktop/ICP/GUI_scan_traj/';

part_dir = '/home/rflin/Desktop/ICP/CADandSTL/arm_sanding/';
part = 'hb.stl';
output_file_dir = '/home/rflin/Desktop/ICP/GUI_scan_traj/';


global Seed_T;

Seed_t = [480.91;-146.46;315.52];                   % in mm
Seed_r = eul2rotm([0 0 0]);                         % in rad (alpha beta gamma rot)
Seed_T = [Seed_r,Seed_t;0 0 0 1];


%% Load Part and all the info
%STLREAD is a function obtaiend from matlab exchange. Refer to the file for
%more details.
[v, f, n, stltitle] = stlRead(strcat(part_dir,part));
delete(gca);
close all;

% Choose what color the CAD part needs to be displayed.
col_matrix = [0.941176, 0.972549, 1];

% Plotting the CAD part in Figure-1
figure(1)
patch('Faces',f,'Vertices',v,'FaceVertexCData',col_matrix,'FaceColor',col_matrix,'FaceAlpha',0.5);
% set(gca,'zdir','reverse')
xlabel('X-Axis')
ylabel('Y-Axis')
zlabel('Z-Axis')
hold on

%% User-Interface for Selection of Points

% Define object for Data Cursor
dcm_obj = datacursormode(figure(1))
set(dcm_obj,'SnapToDataVertex','off')
strt_pts = [];
end_pts = [];
key=0;
flag = 0;
points=[];
grp=[];
normals = [];
idx = 1;
faces=[];
tool_num = [];
xyz_cba = [];
xyz=[];
cba=[];

% Keep Selecting Start and End points alternatively.
while 1
    key=0;
    fprintf('Select Start Point')
    while key==0
        try key = waitforbuttonpress; catch flag=1; break; end
    end
    if flag==1
        fprintf('\nSelection Complete\n');
        break;
    end
    c_info = getCursorInfo(dcm_obj);
    strt_pt = c_info.Position;
    strt_pts = [strt_pts;strt_pt];
    
    key=0;
    fprintf('Select End Point')
    while key==0
        try key = waitforbuttonpress; catch flag=1; break; end
    end
    if flag==1
        fprintf('\nSelection Complete\n');
        break;
    end
    c_info = getCursorInfo(dcm_obj);
    end_pt = c_info.Position;
    end_pts = [end_pts;end_pt];
    
    [temp_pts,temp_normals,temp_faces] = curve_fit(strt_pt,end_pt,v,f,n);  %Call the curve_fit function
    
%     %     making tool_tip straight
%     temp_normals = zeros(size(temp_normals,1),3) + [0 0 1];

    % making pts lower in z direction than they actually are...
    temp_pts(:,3) = temp_pts(:,3);
    faces = [faces;temp_faces]; % Appendng the faces to the matrix
    points = [points;temp_pts]; % Appending the Points in curve
    xyz = [xyz; temp_pts];
    normals = [normals; temp_normals]; %Appending the normals in curve
    
    %Append the Group Indices
    size_points = size(temp_pts);
    idx_start = idx;
    idx = idx + size_points(1,1)-1;
    idx_end = idx;
    range = [idx_start,idx_end];
    grp = [grp;range]; %Append the Group Indices
    % Appending Group Indices complete
    
    [bx,by,bz,strt_idx,end_idx] = compute_TCP_local(xyz,range,normals); %compute_TCP function
    xyz_cba = [xyz_cba; horzcat( temp_pts,bx,by,bz )];
    plot_tcp_local(bx,by,bz,strt_idx,end_idx,points);
    
    
    
    %Plot the Points
    scatter3(points(:,1),points(:,2),points(:,3),200,'*','b'); %Plot the Points
    idx = idx + 1;
end
xyz_nxnynz = [xyz_cba(:,1:3), xyz_cba(:,end-3:end)];

dlmwrite(strcat(output_file_dir,'xyz_frames.csv'),xyz_cba);
dlmwrite(strcat(output_file_dir,'xyz_nxnynz.csv'),xyz_nxnynz);
dlmwrite(strcat(output_file_dir,'Group_IDX.csv'),grp);

run transform_data.m

%% Plot the Tool_TCP

function plot_tcp_local(bx,by,bz,strt_idx,end_idx,points)
bx = bx .* 1;
by = by .* 1;
bz = bz .* 1;

hold on
% Plot the X Vector
quiver3(points(strt_idx:end_idx,1),points(strt_idx:end_idx,2),points(strt_idx:end_idx,3),...
    bx(:,1),bx(:,2),bx(:,3),'r','linewidth',2,'AutoScaleFactor',0.8,'MaxHeadSize',0.6);
hold on
% Plot the Y Vector
quiver3(points(strt_idx:end_idx,1),points(strt_idx:end_idx,2),points(strt_idx:end_idx,3),...
    by(:,1),by(:,2),by(:,3),'g','linewidth',2,'AutoScaleFactor',0.8,'MaxHeadSize',0.6);
hold on
% Plot the Z vector
quiver3(points(strt_idx:end_idx,1),points(strt_idx:end_idx,2),points(strt_idx:end_idx,3),...
    bz(:,1),bz(:,2),bz(:,3),'b','linewidth',2,'AutoScaleFactor',0.8,'MaxHeadSize',0.6);
end
