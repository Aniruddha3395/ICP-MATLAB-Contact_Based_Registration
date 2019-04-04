function [scan_ptcloud,corresponding_val_from_model_ptcloud] = correspondance_with_near_neighbour_for_optimization(model_ptcloud,scan_ptcloud)

% KNN search over KD Tree
global KDtree;

corresponding_val_from_model_ptcloud = zeros(size(scan_ptcloud,1),3);
num_of_neighbours = 1;

for i = 1:size(scan_ptcloud,1)
    idx = knnsearch(KDtree,scan_ptcloud(i,:),'K',num_of_neighbours);
    corresponding_val_from_model_ptcloud(i,:) = model_ptcloud(idx,:);
end

end
