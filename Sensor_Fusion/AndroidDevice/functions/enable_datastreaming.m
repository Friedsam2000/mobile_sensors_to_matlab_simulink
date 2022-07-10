function [AndroidPhone,loggingTime] = enable_datastreaming()
%Define MOBILEDEV object and enable sensor data streaming

AndroidPhone = mobiledev;
AndroidPhone.SampleRate = 100;
AndroidPhone.AngularVelocitySensorEnabled = 1;
AndroidPhone.OrientationSensorEnabled = 1;
AndroidPhone.AccelerationSensorEnabled = 1;
AndroidPhone.MagneticSensorEnabled = 1;

loggingTime = 10; % seconds

end