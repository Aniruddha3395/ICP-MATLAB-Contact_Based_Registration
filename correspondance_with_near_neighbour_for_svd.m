function [scan_ptcloud_modified,corresponding_val_from_model_ptcloud] = correspondance_with_near_neighbour_for_svd(KDtree,model_ptcloud,scan_ptcloud,apply_weightage,upper_bound_fact,lower_bound_fact)

% KNN search over KD Tree

% corresponding_val = zeros(size(scan_ptcloud,1),3);
corresponding_val_from_model_ptcloud = [];
num_of_neighbours = 1;
dist = [];
for i = 1:size(scan_ptcloud,1)
    idx = knnsearch(KDtree,scan_ptcloud(i,:),'K',num_of_neighbours);
    corresponding_val_from_model_ptcloud = [corresponding_val_from_model_ptcloud;model_ptcloud(idx,:)];
    dist = [dist;norm(model_ptcloud(idx,:) - scan_ptcloud(i,:))];
end

if apply_weightage
    med_val = median(dist);
    % upper_bound_fact = 5;
    % lower_bound_fact = 0.1;
    all_idx = find(dist<upper_bound_fact*med_val & dist>lower_bound_fact*med_val);
    scan_ptcloud_modified = scan_ptcloud(all_idx,:);
    corresponding_val_from_model_ptcloud = corresponding_val_from_model_ptcloud(all_idx,:);
else
    scan_ptcloud_modified = scan_ptcloud;
end
end












% function [scan_ptcloud,corresponding_val] = correspondance_with_near_neighbour(KDtree,model_ptcloud,scan_ptcloud)
%
% % KNN search over KD Tree
%
% % corresponding_val = zeros(size(scan_ptcloud,1),3);
% corresponding_val = [];
% num_of_neighbours = 4;
% store_idx = [];
%
% for i = 1:size(scan_ptcloud,1);
% %     disp(i)
%     all_idx = knnsearch(KDtree,scan_ptcloud(i,:),'K',num_of_neighbours);
%     if isempty(find(store_idx==all_idx(1)))==1
%         store_idx = [store_idx;all_idx(1)];
%         corresponding_val = [corresponding_val;model_ptcloud(all_idx(1),:)];
%     elseif isempty(find(store_idx==all_idx(2)))==1
%         store_idx = [store_idx;all_idx(2)];
%         corresponding_val = [corresponding_val;model_ptcloud(all_idx(2),:)];
%     elseif isempty(find(store_idx==all_idx(3)))==1
%         store_idx = [store_idx;all_idx(3)];
%         corresponding_val = [corresponding_val;model_ptcloud(all_idx(3),:)];
%     else
% %         isempty(find(store_idx==all_idx(4)))==1
%         store_idx = [store_idx;all_idx(4)];
%         corresponding_val = [corresponding_val;model_ptcloud(all_idx(4),:)];
%     end
% end
%
% make_unique = [scan_ptcloud,corresponding_val];
% [unique_val,indx] = unique(make_unique(:,4:6),'rows');
% scan_ptcloud = make_unique(indx,1:3);
% corresponding_val = make_unique(indx,4:6);
%
%
%
% % size(store_idx);
% % size(unique(store_idx));
%
% end





% function [scan_ptcloud,corresponding_val] = correspondance_with_near_neighbour(KDtree,model_ptcloud,scan_ptcloud)
%
% % KNN search over KD Tree
%
% % corresponding_val = zeros(size(scan_ptcloud,1),3);
% corresponding_val = [];
% store_idx = [];
% for i = 1:size(scan_ptcloud,1)
%     disp(i)
%     num_of_neighbours = 1;
%     idx = knnsearch(KDtree,scan_ptcloud(i,:),'K',num_of_neighbours);
%     while isempty(find(store_idx==idx))~=1
% %         store_idx
% %         idx
% %         num_of_neighbours
%         num_of_neighbours = num_of_neighbours + 1;
%         all_idx = knnsearch(KDtree,scan_ptcloud(i,:),'K',num_of_neighbours);
% %         pause(1)
%         idx = all_idx(num_of_neighbours);
%     end
%     store_idx = [store_idx;idx];
%     corresponding_val = [corresponding_val;model_ptcloud(idx,:)];
% % pause(1)
% end
% size(store_idx);
% size(unique(store_idx));
%
% end
