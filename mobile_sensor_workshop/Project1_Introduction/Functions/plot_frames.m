function [] = plot_frames(smartphone_frame,smartphone_frame_origin,world_frame,world_frame_origin)



%Plot frames
quiver3(world_frame_origin(1), world_frame_origin(2), world_frame_origin(3), world_frame(1,1), world_frame(1,2), world_frame(1,3) ,'c', 'MaxHeadSize', 3, 'LineWidth', 3);
hold on
quiver3(world_frame_origin(1), world_frame_origin(2), world_frame_origin(3), world_frame(2,1), world_frame(2,2), world_frame(2,3) ,'m', 'MaxHeadSize', 3, 'LineWidth', 3);
quiver3(world_frame_origin(1), world_frame_origin(2), world_frame_origin(3), world_frame(3,1), world_frame(3,2), world_frame(3,3) ,'y', 'MaxHeadSize', 3, 'LineWidth', 3);
axis([-2 2 -2 2 -2 2]);
xlabel('x');
ylabel('y');
zlabel('z');
quiver3(smartphone_frame_origin(1), smartphone_frame_origin(2), smartphone_frame_origin(3), smartphone_frame(1,1), smartphone_frame(1,2), smartphone_frame(1,3) ,'r', 'MaxHeadSize', 3, 'LineWidth', 3);
quiver3(smartphone_frame_origin(1), smartphone_frame_origin(2), smartphone_frame_origin(3), smartphone_frame(2,1), smartphone_frame(2,2), smartphone_frame(2,3) ,'g', 'MaxHeadSize', 3, 'LineWidth', 3);
quiver3(smartphone_frame_origin(1), smartphone_frame_origin(2), smartphone_frame_origin(3), smartphone_frame(3,1), smartphone_frame(3,2), smartphone_frame(3,3) ,'b', 'MaxHeadSize', 3, 'LineWidth', 3);
hold off

drawnow


end

