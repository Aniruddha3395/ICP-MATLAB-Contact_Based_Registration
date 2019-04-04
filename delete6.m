clc;
clear;
close all;

file_dir = 'C:/Users/ABB IRB120/Desktop/ICP_new/experimental_data/';
variant = 11;
total_files = 67;
table_cell = {};
max_d_all = [];
mean_d_all = [];
for file_num = 1:total_files
    
    for i = 1:variant
        
        switch i
            case 1
                mean_wt = 100;max_wt = 0;
            case 2
                mean_wt = 90;max_wt = 10;
            case 3
                mean_wt = 80;max_wt = 20;
            case 4
                mean_wt = 75;max_wt = 25;
            case 5
                mean_wt = 70;max_wt = 30;
            case 6
                mean_wt = 60;max_wt = 40;
            case 7
                mean_wt = 50;max_wt = 50;
            case 8
                mean_wt = 40;max_wt = 60;
            case 9
                mean_wt = 30;max_wt = 70;
            case 10
                mean_wt = 20;max_wt = 80;
            case 11
                mean_wt = 10;max_wt = 90;
        end
        
        folder_name = strcat('sol_',num2str(mean_wt),'mean_',num2str(max_wt),'max_plane_d/');
        file_name = strcat('solution_T_',num2str(file_num),'.txt');
        a = fopen(strcat(file_dir,folder_name,file_name),'r');
        c = textscan(a,'%s');
        fclose(a);
        c{1,1};
        % reading 1
        max_d1(i,1) = str2double(c{1,1}{3,1});
        max_plane_d1(i,1) = str2double(c{1,1}{7,1});
        mean_d1(i,1) = str2double(c{1,1}{11,1});
        mean_plane_d1(i,1) = str2double(c{1,1}{15,1});
        weighted_max_mean_d1 = str2double(c{1,1}{19,1});
        Final_w_T_p1 = zeros(4);
        Final_w_T_p1(1,1) = str2double(c{1,1}{23,1});
        Final_w_T_p1(1,2) = str2double(c{1,1}{24,1});
        Final_w_T_p1(1,3) = str2double(c{1,1}{25,1});
        Final_w_T_p1(1,4) = str2double(c{1,1}{26,1});
        Final_w_T_p1(2,1) = str2double(c{1,1}{27,1});
        Final_w_T_p1(2,2) = str2double(c{1,1}{28,1});
        Final_w_T_p1(2,3) = str2double(c{1,1}{29,1});
        Final_w_T_p1(2,4) = str2double(c{1,1}{30,1});
        Final_w_T_p1(3,1) = str2double(c{1,1}{31,1});
        Final_w_T_p1(3,2) = str2double(c{1,1}{32,1});
        Final_w_T_p1(3,3) = str2double(c{1,1}{33,1});
        Final_w_T_p1(3,4) = str2double(c{1,1}{34,1});
        Final_w_T_p1(4,1) = str2double(c{1,1}{35,1});
        Final_w_T_p1(4,2) = str2double(c{1,1}{36,1});
        Final_w_T_p1(4,3) = str2double(c{1,1}{37,1});
        Final_w_T_p1(4,4) = str2double(c{1,1}{38,1});
        % reading 2
        max_d2(i,1) = str2double(c{1,1}{41,1});
        max_plane_d2(i,1) = str2double(c{1,1}{45,1});
        mean_d2(i,1) = str2double(c{1,1}{49,1});
        mean_plane_d2(i,1) = str2double(c{1,1}{53,1});
        weighted_max_mean_d2 = str2double(c{1,1}{57,1});
        Final_w_T_p2 = zeros(4);
        Final_w_T_p2(1,1) = str2double(c{1,1}{61,1});
        Final_w_T_p2(1,2) = str2double(c{1,1}{62,1});
        Final_w_T_p2(1,3) = str2double(c{1,1}{63,1});
        Final_w_T_p2(1,4) = str2double(c{1,1}{64,1});
        Final_w_T_p2(2,1) = str2double(c{1,1}{65,1});
        Final_w_T_p2(2,2) = str2double(c{1,1}{66,1});
        Final_w_T_p2(2,3) = str2double(c{1,1}{67,1});
        Final_w_T_p2(2,4) = str2double(c{1,1}{68,1});
        Final_w_T_p2(3,1) = str2double(c{1,1}{69,1});
        Final_w_T_p2(3,2) = str2double(c{1,1}{70,1});
        Final_w_T_p2(3,3) = str2double(c{1,1}{71,1});
        Final_w_T_p2(3,4) = str2double(c{1,1}{72,1});
        Final_w_T_p2(4,1) = str2double(c{1,1}{73,1});
        Final_w_T_p2(4,2) = str2double(c{1,1}{74,1});
        Final_w_T_p2(4,3) = str2double(c{1,1}{75,1});
        Final_w_T_p2(4,4) = str2double(c{1,1}{76,1});
        Final_w_T_p{file_num,2*i-1} = Final_w_T_p1;
        Final_w_T_p{file_num,2*i} = Final_w_T_p2;
        
        disp([file_num,i])
        disp([Final_w_T_p1]);
        
    end
    
    table1 = [max_d1,mean_d1,max_plane_d1,mean_plane_d1];
    table2 = [max_d2,mean_d2,max_plane_d2,mean_plane_d2];
    max_d_all = [max_d_all;max_d1(11,1)];
    mean_d_all = [mean_d_all;mean_d1(11,1)];

    table_cell{file_num,1} = table1;
    table_cell{file_num,2} = table2;
    
end




% max_d_all
% mean_d_all
% %data table
% file_write = fopen('data_table.txt','wt');
% fprintf(file_write,'\t\t\t\t\tmax_d_1 \t mean_d_1 \t max_plane_d_1 \t mean_plane_d_1 \t max_d_2 \t mean_d_2 \t max_plane_d_2 \t mean_plane_d_2\n\n');
% for file_num = 1:total_files
%     fprintf(file_write,'\ndata%d\n',file_num);
%     for i = 1:variant
%         switch i
%             case 1
%                 name_str = 'mean100_max0';
%             case 2
%                 name_str = 'mean90_max10';
%             case 3
%                 name_str = 'mean80_max20';
%             case 4
%                 name_str = 'mean75_max25';
%             case 5
%                 name_str = 'mean70_max30';
%             case 6
%                 name_str = 'mean60_max40';
%             case 7
%                 name_str = 'mean50_max50';
%             case 8
%                 name_str = 'mean40_max60';
%             case 9
%                 name_str = 'mean30_max70';
%             case 10
%                 name_str = 'mean20_max80';
%             case 11
%                 name_str = 'mean10_max90';
%         end
%         fprintf(file_write,'%s\t\t%f \t %f  \t  %f    \t    %f    \t %f \t %f \t   %f \t   %f\n',name_str,...
%             table_cell{file_num,1}(i,1),table_cell{file_num,1}(i,2),table_cell{file_num,1}(i,3),...
%             table_cell{file_num,1}(i,4),table_cell{file_num,2}(i,1),table_cell{file_num,2}(i,2),...
%             table_cell{file_num,2}(i,3),table_cell{file_num,2}(i,4));
%     end
% end
% fclose(file_write);
% 
% %transformation matrix table
% file_write = fopen('transformation_mat.txt','wt');
% fprintf(file_write,'\t\t\t\tFinal_w_T_p_1 \t\t\t\t\t\t \t\t\t\t\t\tFinal_w_T_p_2\n\n');
% for file_num = 1:total_files
%     fprintf(file_write, '\n\n\ndata%d\n',file_num);
%     for i = 1:variant
%         switch i
%             case 1
%                 name_str = 'mean100_max0';
%             case 2
%                 name_str = 'mean90_max10';
%             case 3
%                 name_str = 'mean80_max20';
%             case 4
%                 name_str = 'mean75_max25';
%             case 5
%                 name_str = 'mean70_max30';
%             case 6
%                 name_str = 'mean60_max40';
%             case 7
%                 name_str = 'mean50_max50';
%             case 8
%                 name_str = 'mean40_max60';
%             case 9
%                 name_str = 'mean30_max70';
%             case 10
%                 name_str = 'mean20_max80';
%             case 11
%                 name_str = 'mean10_max90';
%         end
%         fprintf(file_write, '\n\t%s\n\n',name_str);
%         fprintf(file_write,'\t%f\t%f\t%f\t%f\t\t\t%f\t%f\t%f\t%f\n',Final_w_T_p{file_num,2*i-1}(1,1),Final_w_T_p{file_num,2*i-1}(1,2),Final_w_T_p{file_num,2*i-1}(1,3),Final_w_T_p{file_num,2*i-1}(1,4),Final_w_T_p{file_num,2*i}(1,1),Final_w_T_p{file_num,2*i}(1,2),Final_w_T_p{file_num,2*i}(1,3),Final_w_T_p{file_num,2*i}(1,4));
%         fprintf(file_write,'\t%f\t%f\t%f\t%f\t\t\t%f\t%f\t%f\t%f\n',Final_w_T_p{file_num,2*i-1}(2,1),Final_w_T_p{file_num,2*i-1}(2,2),Final_w_T_p{file_num,2*i-1}(2,3),Final_w_T_p{file_num,2*i-1}(2,4),Final_w_T_p{file_num,2*i}(2,1),Final_w_T_p{file_num,2*i}(2,2),Final_w_T_p{file_num,2*i}(2,3),Final_w_T_p{file_num,2*i}(2,4));
%         fprintf(file_write,'\t%f\t%f\t%f\t%f\t\t\t%f\t%f\t%f\t%f\n',Final_w_T_p{file_num,2*i-1}(3,1),Final_w_T_p{file_num,2*i-1}(3,2),Final_w_T_p{file_num,2*i-1}(3,3),Final_w_T_p{file_num,2*i-1}(3,4),Final_w_T_p{file_num,2*i}(3,1),Final_w_T_p{file_num,2*i}(3,2),Final_w_T_p{file_num,2*i}(3,3),Final_w_T_p{file_num,2*i}(3,4));
%         fprintf(file_write,'\t%f\t%f\t%f\t%f\t\t\t%f\t%f\t%f\t%f\n',Final_w_T_p{file_num,2*i-1}(4,1),Final_w_T_p{file_num,2*i-1}(4,2),Final_w_T_p{file_num,2*i-1}(4,3),Final_w_T_p{file_num,2*i-1}(4,4),Final_w_T_p{file_num,2*i}(4,1),Final_w_T_p{file_num,2*i}(4,2),Final_w_T_p{file_num,2*i}(4,3),Final_w_T_p{file_num,2*i}(4,4));
%     end
% end
% fclose(file_write);



