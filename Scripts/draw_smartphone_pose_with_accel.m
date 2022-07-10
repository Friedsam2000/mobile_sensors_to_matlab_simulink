%% Tip: To stop the plotting, click the console window and press Strg+C

clc
close all
clear

%Enable orientation sensor
addpath([pwd, '\init']);
m = init_sensors(0,1,1,0,0);

%% 3D Draw the pose of the smartphone with the measured gravity vector in world frame

%Set an initial yaw so the x-Axis of world frame and smartphone frame are alligned at startup.
starting_rotation = 90; %[DEG]
initial_yaw = deg2rad(m.Orientation(1) + starting_rotation);

while(1)
    
    %Convert Yaw Roll and Pitch to RAD and calculate yaw in relation to initial_yaw
    yaw = initial_yaw-deg2rad(m.Orientation(1));
    pitch = deg2rad(m.Orientation(2));
    roll = deg2rad(m.Orientation(3));
   
    %Calculate the transformation matrix from smartphone frame to world frame
    R_smartphone_to_world = Rz(yaw)*Ry(pitch)*Rx(roll)*Rz(-pi/2);
    
    %Calculate the transformation matrix fro world frame to smartphone frame
    R_world_to_smartphone = inv(R_smartphone_to_world);
    
    %Define world frame
    world_frame = [1 0 0;
                   0 1 0; 
                   0 0 1];
    
    %Calculate smartphone frame          
    smartphone_frame = R_world_to_smartphone * world_frame;
    
    %Measure acceleration in smartphone_frame
    accel_smartphone = m.Acceleration';
        
    %Calculate acceleration in world frame
    accel_world =  R_smartphone_to_world * accel_smartphone;
    
    
    %Plot acceleration vector in same plot as orientation
    quiver3(0, 0, 0, accel_world(1)/5, accel_world(2)/5, accel_world(3)/5,'c', 'MaxHeadSize', 3, 'LineWidth', 3);
    hold on    
    %Plot smartphone axis
    quiver3(0, 0, 0, smartphone_frame(1,1), smartphone_frame(1,2), smartphone_frame(1,3) ,'r', 'MaxHeadSize', 3, 'LineWidth', 3);
    quiver3(0, 0, 0, smartphone_frame(2,1), smartphone_frame(2,2), smartphone_frame(2,3) ,'g', 'MaxHeadSize', 3, 'LineWidth', 3);
    quiver3(0, 0, 0, smartphone_frame(3,1), smartphone_frame(3,2), smartphone_frame(3,3) ,'b', 'MaxHeadSize', 3, 'LineWidth', 3);
    axis([-2 2 -2 2 -2 2]);
    hold off
    drawnow

end


%% Rotatoin Matrix Definition


function Rz = Rz(rotZ)
    
        Rz = [cos(rotZ) -sin(rotZ) 0;
             sin(rotZ)  cos(rotZ) 0;
              0        0     1;];

end

function Ry = Ry(rotY)
    
        Ry = [cos(rotY) 0 sin(rotY);
              0         1       0;
             -sin(rotY) 0 cos(rotY)];

end

function Rx = Rx(rotX)
    
        Rx = [1      0             0;
              0 cos(rotX)  -sin(rotX);
              0 sin(rotX)  cos(rotX)];

end
