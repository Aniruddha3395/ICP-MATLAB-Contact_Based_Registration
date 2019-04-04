function [T_Final,pts,bx_transformed,by_transformed,bz_transformed] = robot_trajectory(Complete_T,transformed_pts,bx,by,bz,main_dir,output_file,output_file_path)

T_Final = inv(Complete_T);
pts = apply_transformation(transformed_pts,T_Final);
scatter3d(pts,'*')

bx_transformed = bx';
bx_transformed = T_Final(1:3,1:3) * bx_transformed;
bx_transformed = bx_transformed';

by_transformed = by';
by_transformed = T_Final(1:3,1:3) * by_transformed;
by_transformed = by_transformed';

bz_transformed = bz';
bz_transformed = T_Final(1:3,1:3) * bz_transformed;
bz_transformed = bz_transformed';

scatter3d(pts,'filled');
plot_tcp(pts,bx_transformed,by_transformed,bz_transformed);

%output with respect to robot base and also with respect to TCP
pts(:,1:3) = pts(:,1:3)./1000;      %making mm to meters
dlmwrite(strcat(main_dir,output_file_path,output_file),[pts,bx_transformed,by_transformed,bz_transformed]);
end