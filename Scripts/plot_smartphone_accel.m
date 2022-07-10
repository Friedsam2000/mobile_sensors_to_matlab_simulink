%% Tip: To stop the plotting, click the console window and press Strg+C

clc
close all
clear

%Enable orientation sensor
addpath([pwd, '\init']);
m = init_sensors(0,1,1,0,0);


%% Plot acceleration without the gravity in world frame or smartphone frame

%init
t_max = 100;
dt = 0.01;
i_max = t_max / dt;
a_meas = zeros(3,i_max);
gravity_smartphone = zeros(3,i_max);
accel_smartphone = zeros(3,i_max);
accel_smartphone_without_gravity = zeros(3,i_max);
accel_world_without_gravity = zeros(3, i_max);
t = zeros(i_max);

%Set an initial yaw so the x-Axis of world frame and smartphone frame are alligned at startup.
starting_rotation = 90; %[DEG]
initial_yaw = deg2rad(m.Orientation(1) + starting_rotation);

for i = 1:i_max
    
    %Calculate current time
    t(i) = dt*i;
    
    %Convert Yaw Roll and Pitch to RAD and calculate yaw in relation to initial_yaw
    yaw = initial_yaw-deg2rad(m.Orientation(1));
    pitch = deg2rad(m.Orientation(2));
    roll = deg2rad(m.Orientation(3));
    
    %Calculate the transformation matrix from smartphone frame to world frame
    R_smartphone_to_world = Rz(yaw)*Ry(pitch)*Rx(roll)*Rz(-pi/2);
    
    %Calculate the transformation matrix fro world frame to smartphone frame
    R_world_to_smartphone = inv(R_smartphone_to_world);
   
    %Measure acceleration in smartphone_frame
    accel_smartphone(:,i) = m.Acceleration';
    
    %Define gravity im world frame
    gravity_world = [0; 0; 9.81];
    
    %Calculate gravity in smartphone frame
    gravity_smartphone(:,i) = R_world_to_smartphone*gravity_world;
    
    %Calculate accel without gravity in smartphone frame
    accel_smartphone_without_gravity(:,i) = accel_smartphone(:,i) - gravity_smartphone(:,i);
    
    %Calculate accel without gravity in worldframe
    accel_world_without_gravity(:,i) = R_smartphone_to_world * accel_smartphone_without_gravity(:,i);

    %Plot accel without gravity in world frame
    plot(t(1:i),accel_world_without_gravity(1,1:i),'r');
    hold on
    plot(t(1:i),accel_world_without_gravity(2,1:i),'g');
    plot(t(1:i),accel_world_without_gravity(3,1:i),'b');
    hold off
    
    %Plot accel without gravity in smartphone frame
%     plot(t(1:i),accel_smartphone_without_gravity(1,1:i),'r');
%     hold on
%     plot(t(1:i),accel_smartphone_without_gravity(2,1:i),'g');
%     plot(t(1:i),accel_smartphone_without_gravity(3,1:i),'b');
%     hold off
%     
    
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
