clc;
clear;
close all;

%input
pt_cloud = randi([-200,200],2000,3);
input_pt = [5,5,5];

scatter3(pt_cloud(:,1),pt_cloud(:,2),pt_cloud(:,3),'filled')
daspect([1 1 1]);
closest_pt = norm(input_pt-pt_cloud(1,:));
%brute force
for i = 2:size(pt_cloud)
    if norm(input_pt-pt_cloud(i,:))<norm(input_pt-closest_pt)
        closest_pt = pt_cloud(i,:);
    end
end
hold on;
scatter3(closest_pt(1),closest_pt(2),closest_pt(3),'y','filled')
closest_pt
norm(closest_pt-input_pt)

centroid = mean(pt_cloud);
store_pt_cloud = {[],[],[],[],[],[],[],[]};

for i = 1:size(pt_cloud)
   if pt_cloud(i,1)>=centroid(1,1) && pt_cloud(i,2)>=centroid(1,2) && pt_cloud(i,3)>=centroid(1,3) 
        store_pt_cloud{1,1} = [store_pt_cloud{1,1};pt_cloud(i,:)];
   elseif pt_cloud(i,1)<=centroid(1,1) && pt_cloud(i,2)>=centroid(1,2) && pt_cloud(i,3)>=centroid(1,3) 
        store_pt_cloud{1,2} = [store_pt_cloud{1,2};pt_cloud(i,:)];
   elseif pt_cloud(i,1)>=centroid(1,1) && pt_cloud(i,2)<=centroid(1,2) && pt_cloud(i,3)>=centroid(1,3) 
        store_pt_cloud{1,3} = [store_pt_cloud{1,3};pt_cloud(i,:)];
   elseif pt_cloud(i,1)>=centroid(1,1) && pt_cloud(i,2)>=centroid(1,2) && pt_cloud(i,3)<=centroid(1,3) 
        store_pt_cloud{1,4} = [store_pt_cloud{1,4};pt_cloud(i,:)];
   elseif pt_cloud(i,1)<=centroid(1,1) && pt_cloud(i,2)<=centroid(1,2) && pt_cloud(i,3)>=centroid(1,3) 
        store_pt_cloud{1,5} = [store_pt_cloud{1,5};pt_cloud(i,:)];
   elseif pt_cloud(i,1)<=centroid(1,1) && pt_cloud(i,2)>=centroid(1,2) && pt_cloud(i,3)<=centroid(1,3) 
        store_pt_cloud{1,6} = [store_pt_cloud{1,6};pt_cloud(i,:)];
   elseif pt_cloud(i,1)>=centroid(1,1) && pt_cloud(i,2)<=centroid(1,2) && pt_cloud(i,3)<=centroid(1,3) 
        store_pt_cloud{1,7} = [store_pt_cloud{1,7};pt_cloud(i,:)];
   else 
        store_pt_cloud{1,8} = [store_pt_cloud{1,8};pt_cloud(i,:)];
   end
end

%%region_selection
norm_vals = [norm(input_pt-mean(store_pt_cloud{1,1}));
            norm(input_pt-mean(store_pt_cloud{1,2}));
            norm(input_pt-mean(store_pt_cloud{1,3}));
            norm(input_pt-mean(store_pt_cloud{1,4}));
            norm(input_pt-mean(store_pt_cloud{1,5}));
            norm(input_pt-mean(store_pt_cloud{1,6}));
            norm(input_pt-mean(store_pt_cloud{1,7}));
            norm(input_pt-mean(store_pt_cloud{1,8}))];

min_norm_val = find(norm_vals==min(norm_vals));
closer_region = store_pt_cloud{min_norm_val};

closest_pt = closer_region(1,:);
for i = 2:size(closer_region,1)
    if norm(input_pt-closer_region(i,:))<norm(input_pt-closest_pt)
        closest_pt = closer_region(i,:);
    end
end

hold on;
scatter3(closest_pt(1),closest_pt(2),closest_pt(3),'r','filled')
closest_pt
norm(closest_pt-input_pt)
hold on;
scatter3(input_pt(1),input_pt(2),input_pt(3),'g','filled')