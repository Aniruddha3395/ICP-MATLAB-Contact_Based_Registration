function [xyz_bxbybz_transformed] = apply_transformation_to_xyz_bybybz(xyz_bxbybz,transformation_matrix)
% code for applying transfromation on xyz points as well as orientation
% vectors bx, by and bz

xyz_bxbybz_transformed = zeros(size(xyz_bxbybz));
xyz_bxbybz_transformed(:,1:3) = apply_transformation(xyz_bxbybz(:,1:3),transformation_matrix);

% making translation component of transformation matrix to zero

transformation_matrix(1:3,4) = 0;
xyz_bxbybz_transformed(:,4:6) = apply_transformation(xyz_bxbybz(:,4:6),transformation_matrix);
xyz_bxbybz_transformed(:,7:9) = apply_transformation(xyz_bxbybz(:,7:9),transformation_matrix);
xyz_bxbybz_transformed(:,10:12) = apply_transformation(xyz_bxbybz(:,10:12),transformation_matrix);

end