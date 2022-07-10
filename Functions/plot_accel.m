function [] = plot_accel(R,accel)
    %% Plotting
    %Define world frame
    world_frame = [1 0 0;
                   0 1 0; 
                   0 0 1];
    
    world_frame_origin = [-2; -2; -2];
   
    %Calculate Smartphone Frame
    smartphone_frame = R*world_frame;
    smartphone_frame_origin = [0; 0; 0];
    
    %Plot acceleration vector
    quiver3(0, 0, 0, accel(1)/5, accel(2)/5, accel(3)/5,'c', 'MaxHeadSize', 3, 'LineWidth', 3);
    hold on    
    %Plot smartphone frame and world frame
    plot_frames(smartphone_frame,smartphone_frame_origin,world_frame,world_frame_origin);
end

