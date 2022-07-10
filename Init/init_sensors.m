%% This script is used for initialization of the sensor streaming. Please dont change.

function m = init_sensors(AngularSnsEnbl, OrientSnsEnbl, AccelSnsEnbl, MagneticSnsEnbl, PosSnsEnbl)



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
    m.AngularVelocitySensorEnabled = AngularSnsEnbl;
    m.OrientationSensorEnabled = OrientSnsEnbl;
    m.AccelerationSensorEnabled = AccelSnsEnbl;
    m.MagneticSensorEnabled = MagneticSnsEnbl;
    m.Logging = 1;
    m.PositionSensorEnabled = PosSnsEnbl;



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


        disp("Waiting for sensors...");
        pause(1)

    end

    disp("Successfully streaming Sensor Data!");
    
end
