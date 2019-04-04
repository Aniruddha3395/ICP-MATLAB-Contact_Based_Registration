function [part_ptcloud,part_ptcloud_normals] = generate_part_ptcloud_from_part_STL(part_stl)

global icp_dir data_file_dir;

[v, f, n, ~] = stlRead(part_stl);

use_face_centroid = false;
%make code where get combination of mesh and centroid and where i can
%assign normals to the mesh pts as well...that will be the avg of
%respective triangles
if use_face_centroid
    % storing centroid of each triangle as model ptcloud
    face_centroid = zeros(size(f,1),3);
    for i = 1:size(f,1)
        face_centroid(i,1) = (v(f(i,1),1)+v(f(i,2),1)+v(f(i,3),1))/3;
        face_centroid(i,2) = (v(f(i,1),2)+v(f(i,2),2)+v(f(i,3),2))/3;
        face_centroid(i,3) = (v(f(i,1),3)+v(f(i,2),3)+v(f(i,3),3))/3;
    end
    part_ptcloud = face_centroid;
    part_ptcloud_normals = n;
else
    % storing vertices of mesh as model ptcloud
    part_ptcloud = v;
    part_ptcloud_normals = zeros(size(v,1),3);
end
dlmwrite(strcat(icp_dir,data_file_dir,'part_ptcloud.csv'),part_ptcloud);
dlmwrite(strcat(icp_dir,data_file_dir,'part_ptcloud_normals.csv'),part_ptcloud_normals);
end
