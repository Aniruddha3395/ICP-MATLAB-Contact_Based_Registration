function part_plot_Alpha(source,event)
global w_T_part;
global part_position;
global part_orientation;

global original_v;
global original_f;
global original_n;
global original_name;
global raw_scan_pts_wrt_tcp;

    part_orientation(1) = source.Value;
    w_T_part(1:3,1:3) = eul2rotm(part_orientation);
    w_T_part(1:3,4) = part_position'; 
    cla;
    [v,n] = stlTransform(original_v,original_n,w_T_part);
    stlPlot(v, original_f, original_name, [0.5 0.5 0.5]);
%     axis([-1 1 -1 1 -1 1])
    daspect([1 1 1])    
    hold on;
    scatter3d(raw_scan_pts_wrt_tcp,'.');
    run find_True_w_T_p;
end