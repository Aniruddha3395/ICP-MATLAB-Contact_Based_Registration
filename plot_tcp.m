function plot_tcp(points,bx,by,bz)
    bx = bx .* 1;
    by = by .* 1;
    bz = bz .* 1;
    
    quiver_length = 4;
    line_width = 0.5;
    
    hold on
    % Plot the X Vector
    quiver3(points(:,1),points(:,2),points(:,3),...
       bx(:,1),bx(:,2),bx(:,3),quiver_length,'r','linewidth',line_width);
    hold on
    % Plot the Y Vector
    quiver3(points(:,1),points(:,2),points(:,3),...
       by(:,1),by(:,2),by(:,3),quiver_length,'g','linewidth',line_width);
    hold on
    % Plot the Z vector
    quiver3(points(:,1),points(:,2),points(:,3),...
       bz(:,1),bz(:,2),bz(:,3),quiver_length,'b','linewidth',line_width);
    hold on
end
