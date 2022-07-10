%% Tip: To stop the plotting, click the console window and press Strg+C

clc
close all
clear

%Enable orientation sensor
addpath([pwd, '\init']);
m = init_sensors(0,1,1,0,0);

%% Draw the smartphones movement using the IMU


%Init
t_max = 200; %in s
dt = 0.01; % in 
n = t_max/dt;
X = zeros(3,n);
V = zeros(3,n);
A = zeros(3,n+1);
t = zeros(1,n);
room_size = 0.01;

%Set an initial yaw so the x-Axis of world frame and smartphone frame are alligned at startup.
starting_rotation = 90; %[DEG]
initial_yaw = deg2rad(m.Orientation(1) + starting_rotation);

for i = 1:n
    
    %Convert Yaw Roll and Pitch to RAD and calculate yaw in relation to initial_yaw
    yaw = initial_yaw-deg2rad(m.Orientation(1));
    pitch = deg2rad(m.Orientation(2));
    roll = deg2rad(m.Orientation(3));
    
    %Calculate the transformation matrix from smartphone frame to world frame
    R_smartphone_to_world = Rz(yaw)*Ry(pitch)*Rx(roll)*Rz(-pi/2);
    
    %Calculate the transformation matrix from world frame to smartphone frame
    R_world_to_smartphone = inv(R_smartphone_to_world);
   
    %Measure acceleration in smartphone frame
    accel_smartphone = m.Acceleration';
    
    %Define gravity im world frame
    gravity_world = [0; 0; 9.81];
    
    %Calculate gravity in smartphone frame
    gravity_smartphone = R_world_to_smartphone*gravity_world;
    
    %Calculate accel without gravity in smartphone frame
    accel_smartphone_without_gravity = accel_smartphone - gravity_smartphone;
    
    %Calculate accel without gravity in worldframe
    accel_world_without_gravity = R_smartphone_to_world * accel_smartphone_without_gravity;
    
    A(:,i) = accel_world_without_gravity';
    %Integrate Acceleration and filter the constant part --> current speed
    V(:,i+1) = 0.2*V(:,i) + dt * A(:,i); 
    %Integrate speed --> position
    X(:,i+1) = X(:,i) + dt * V(:,i+1);
    t(1,i+1) = t(i) + dt;
  
    %Compute with 1/dt Hz
    pause(dt);
    
    %Plot smartphone path
    if i > 20
        plot3(X(1,i-10:i),X(2,i-10:i),X(3,i-10:i));
        axis([X(1,i)-room_size X(1,i)+room_size X(2,i)-room_size  X(2,i)+room_size X(3,i)-room_size  X(3,i)+room_size]);
        grid on
    end
    
    
    drawnow;
    
  
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

