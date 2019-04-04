function [true_ptcloud,transformed_ptcloud] = generate_sample_data_for_icp_from_STL(STL_file)

[v1, ~, ~, ~] = stlRead(STL_file);

rot = [
    0.9848         0    0.1736;
         0    1.0000         0;
   -0.1736         0    0.9848
];
trans = [0;0;10];
T = [rot,trans;0 0 0 1];
     
v2 = apply_transformation(v1,T);

true_ptcloud = v1;
% v2 = v2(1:300,:);
transformed_ptcloud = v2;


end
