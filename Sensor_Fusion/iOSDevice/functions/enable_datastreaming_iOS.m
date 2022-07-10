function [iOSDevice,loggingTime] = enable_datastreaming_iOS()
%Define MOBILEDEV object and enable sensor data streaming

iOSDevice = mobiledev;
iOSDevice.SampleRate = 100;
iOSDevice.AngularVelocitySensorEnabled = 1;
iOSDevice.OrientationSensorEnabled = 1;
iOSDevice.AccelerationSensorEnabled = 1;
iOSDevice.MagneticSensorEnabled = 1;

loggingTime = 10; % second
end