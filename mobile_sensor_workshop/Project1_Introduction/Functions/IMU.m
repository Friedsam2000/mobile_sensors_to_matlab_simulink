function [accel_world_without_gravity] = IMU(yaw,pitch,roll,accel_smartphone)
    
    %Calculate R (from Task 1.3) smartphone_frame = R * world_frame
    R = getR(yaw,pitch,roll);
    
    %Define gravity im world frame
    gravity_world = [0; 0; 9.81];
    
    %Transform gravity in smartphone frame
    gravity_smartphone = R*gravity_world;
    
    %Subtract gravity in smartphone frame
    accel_smartphone_without_gravity = accel_smartphone - gravity_smartphone;
    
    %Transform accel without gravity in worldframe
    accel_world_without_gravity = inv(R) * accel_smartphone_without_gravity;
    
end

