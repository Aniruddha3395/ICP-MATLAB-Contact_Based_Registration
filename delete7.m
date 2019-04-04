clc
clear;
close all;
p_mean_d = [];
p_max_d = [];

for i = 18:67
a = fopen(strcat('C:/Users/ABB IRB120/Desktop/ICP_new/experimental_data/perturbed_val/perturb_data',num2str(i),'.txt'),'r');
c = textscan(a,'%s');
fclose(a);
p_max_d = [p_max_d;str2double(c{1,1}{43,1})];
p_mean_d = [p_mean_d;str2double(c{1,1}{47,1})];
end

dlmwrite('p_max_d.txt',p_max_d);
dlmwrite('p_mean_d.txt',p_mean_d);