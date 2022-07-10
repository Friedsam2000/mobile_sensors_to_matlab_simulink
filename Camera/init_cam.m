%% This script is used for initialization of the sensor streaming. Please dont change.

clc


% Wait for user to open app and enable sensor access
disp("Trying to connect to mobile device via mathworks account...");
while(~exist('m', 'var'))
    

    try
        
        list = mobiledevlist;

        deviceName = list{1,1};

        deviceName = deviceName{1,1};

        m = mobiledev(deviceName);
        
        m.Device;
        
        break;
        
    catch
        disp("Retrying...")
        pause(1);
    end
    
end

m.AngularVelocitySensorEnabled = 0;
m.OrientationSensorEnabled = 0;
m.AccelerationSensorEnabled = 0;
m.MagneticSensorEnabled = 0;
m.Logging = 0;
m.PositionSensorEnabled = 0;


disp("Successfully connected to:");
disp(m.Device);
