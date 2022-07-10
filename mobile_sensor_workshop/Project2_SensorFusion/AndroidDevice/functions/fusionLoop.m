function [eulFilt] = fusionLoop(t,a,w,m,aFilter)
%Fusion processing loop

for i=1:length(t)
    % This is where the AHRS fusion function is called 
    % Note: Yaw is calculated with respect to the magnetic north
    
 
    % 90 degree rotation to match the phone reference frame 
    
    
    % Convert quarternion into Euler angles
    
    
end

% Release the system object
release(aFilter)
end