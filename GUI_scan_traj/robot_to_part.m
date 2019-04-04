%% Compute Transformation of Points and Euler Angles from part to Robot

function [points,bx,by,bz] = robot_to_part(points,bx,by,bz)
xyz_abc = [];

global Seed_T;

% part_points = [256.6,9.905,286.2;
%     387.6,10.97,310.6;
%     633.3,6.84,210.5;
%     397.5,117.4,337.7
%     ];
% 
% robot_points = [516.4,-200.42,290.59;
%     503.43,-57.17,319.39;
%     485.62,187.63,235.43;
%     415.44,-48.12,336.71
%     ];

part_points = [
    0, 0.82, 5.92;
    0, 249.68, 47.52;
    752.48, 249.68, 47.52;
    752.48, 0.82, 5.92
    ];

robot_points = [
    385.62, 372.98, 11.33;
    631.25, 375.52, 57.89;
    633.94, -378.44, 53.31;
    384.81, -376.38, 7.69
    ];

[R,t] = point_pairs_transformation(part_points,robot_points);

T = zeros(4,4);
T(1:3,1:3) = R;
T(1:3,4) = t;
T(4,4) = 1;

% T = Seed_T;

Rdash = T;
Rdash(1:3,4) = [0;0;0];
for i=1:size(points)
    homogeneous_pt = zeros(1,4);
    homogeneous_pt(1,1:3) = points(i,:);
    homogeneous_pt(1,4) = 1;
    transformed_pt = T*homogeneous_pt(1,:)';
    pt = transformed_pt';
    points(i,:) = pt(1,1:3);
end

if size(bx,1)~=0
    for i=1:size(bx)
        homogeneous_norm = zeros(1,4);
        homogeneous_norm(1,1:3) = bx(i,:);
        homogeneous_norm(1,4) = 1;
        transformed_norm = Rdash*homogeneous_norm(1,:)';
        norm = transformed_norm';
        bx(i,:) = norm(1,1:3);
    end
end

if size(by,1)~=0
    for i=1:size(by)
        homogeneous_norm = zeros(1,4);
        homogeneous_norm(1,1:3) = by(i,:);
        homogeneous_norm(1,4) = 1;
        transformed_norm = Rdash*homogeneous_norm(1,:)';
        norm = transformed_norm';
        by(i,:) = norm(1,1:3);
    end
end

if size(bz,1)~=0
    for i=1:size(bz)
        homogeneous_norm = zeros(1,4);
        homogeneous_norm(1,1:3) = bz(i,:);
        homogeneous_norm(1,4) = 1;
        transformed_norm = Rdash*homogeneous_norm(1,:)';
        norm = transformed_norm';
        bz(i,:) = norm(1,1:3);
    end
end

% This function computes the Rotation and Translation matrix.
    function [R,T] = point_pairs_transformation(A,B)
        centroid_A = mean(A);
        centroid_B = mean(B);
        A = A - centroid_A;
        B = B - centroid_B;
        H = A'*B;
        [U,S,V] = svd(H);
        R = V*[1 0 0;0 1 0;0 0 det(V*U')]*U';
        T = -R*centroid_A' + centroid_B';
    end
end