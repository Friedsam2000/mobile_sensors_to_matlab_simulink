function [eulFilt] = fusion_loop(t,a,w,m,aFilter)
%Fusion processing loop

for i=1:length(t)
    % This is where the AHRS fusion function is called 
    orientation(i) = aFilter(a(i,:),w(i,:), m(i,:)); % Note : Yaw is calculated with respect to the magnetic north
 
    % 90 degree rotation to match the phone reference frame 
    qyaw = quaternion([sqrt(2)/2 0 0 sqrt(2)/2]);
    orientation(i) = orientation(i)*qyaw;
    
    % Convert quarternion into Euler angles
    eulFilt(i,:)= euler(orientation(i),'ZYX','frame');
end

% Release the system object
release(aFilter)
end