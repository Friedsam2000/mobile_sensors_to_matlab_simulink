function [eulFilt] = fusionLoop_iOS(t,a,w,m,aFilter)
%Fusion processing loop

for i=1:length(t)
  % This is where the AHRS fusion function is called
  % Note : Yaw is calculated with respect to the magnetic north
  
  
  % 90 deg rotation to match the phone frame
  
  
  % Converts quaternion into Euler angles


end

% Release the system object
release(aFilter);
end