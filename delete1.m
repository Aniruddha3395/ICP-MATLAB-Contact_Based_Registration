clc;
clear;
close all;

%%making knn type method

pts_data = randi([,100],10000,2)
scatter(pts_data(:,1),pts_data(:,2),'filled');

input_pt = [5,5];
region1 = [];    region2 = [];    region3 = [];    region4 = [];

%%making regions
for i = 1:size(pts_data,1)
    if pts_data(i,1)>=0 && pts_data(i,2)>=0
        region1 = [region1;pts_data(i,:)];
    elseif pts_data(i,1)<=0 && pts_data(i,2)>=0
        region2 = [region2;pts_data(i,:)];
    elseif pts_data(i,1)<=0 && pts_data(i,2)<=0
        region3 = [region3;pts_data(i,:)];
    else
        region4 = [region4;pts_data(i,:)];
    end
end
store_data_by_regions = {region1,region2,region3,region4};

%%region_selection
norm_vals = [norm(input_pt-mean(region1));
            norm(input_pt-mean(region2));
            norm(input_pt-mean(region3));
            norm(input_pt-mean(region4))];

min_norm_val = find(norm_vals==min(norm_vals));
closer_region = store_data_by_regions{min_norm_val};

closest_pt = closer_region(1,:);
for i = 2:size(closer_region,1)
    if norm(input_pt-closer_region(i,:))<norm(input_pt-closest_pt)
        closest_pt = closer_region(i,:);
    end
end

hold on;
scatter(closest_pt(1),closest_pt(2),'r','filled')
hold on;
scatter(input_pt(1),input_pt(2),'g','filled')