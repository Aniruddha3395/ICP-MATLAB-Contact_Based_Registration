function [xyz_cba_transformed] = apply_transformation_to_xyz_cba(xyz_cba,transformation_matrix)
% code for applying transfromation on xyz points as well as euler angles
% orientation

xyz_cba_transformed = zeros(size(xyz_cba));
xyz_cba_transformed(:,1:3) = apply_transformation(xyz_cba(:,1:3),transformation_matrix);

% making translation component of transformation matrix to zero
transformation_matrix(1:3,4) = 0;
[bx,by,bz] = euler_to_bxbybz(xyz_cba(:,4:6));
bx = apply_transformation(bx,transformation_matrix);
by= apply_transformation(by,transformation_matrix);
bz = apply_transformation(bz,transformation_matrix);
cba = bxbybz_to_euler(bx,by,bz);
xyz_cba_transformed(:,4:6) = cba;

end