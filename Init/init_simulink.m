%% This script is used for initialization of the sensor streaming. Please dont change.

clc
clear

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


disp("Successfully connected to:");
disp(m.Device);

m.SampleRate = 100;
m.AngularVelocitySensorEnabled = 1;
m.OrientationSensorEnabled = 1;
m.AccelerationSensorEnabled = 1;
m.MagneticSensorEnabled = 1;
m.Logging = 1;
m.PositionSensorEnabled = 1;



% Wait for user to press start in the sensor tab
while(isempty(m.Orientation))
    

    try
        m.Acceleration(3);
        break;
    end
    try
        m.Orientation(3);
        break;
    end
    try
        m.MagneticField(3);
        break;
    end
    try
        m.AngularVelocity(3);
        break;
    end

            
    disp("Waiting for mobile user to enable sensors and press Start...");
    pause(1)
    
end

disp("Successfully streaming Sensor Data!");
