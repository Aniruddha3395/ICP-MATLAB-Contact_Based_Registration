%% Compute Euler Angles

function [abc,R] = compute_euler(bx,by,bz)
    Gx = [1,0,0];
    Gy = [0,1,0];
    Gz = [0,0,1];
    abc = [];
    for i=1:size(bx)
        R = zeros(3,3);
        R(1,1) = dot(bx(i,:),Gx);    R(1,2) = dot(by(i,:),Gx);    R(1,3) = dot(bz(i,:),Gx);
        R(2,1) = dot(bx(i,:),Gy);    R(2,2) = dot(by(i,:),Gy);    R(2,3) = dot(bz(i,:),Gy);
        R(3,1) = dot(bx(i,:),Gz);    R(3,2) = dot(by(i,:),Gz);    R(3,3) = dot(bz(i,:),Gz);
        
        abc = [abc; rotm2eul(R , 'ZYX')];
    end
end