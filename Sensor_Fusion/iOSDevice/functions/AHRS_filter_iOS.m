function [aFilter] = AHRS_filter_iOS(iOSDevice)
%Define the AHRS filter and assign sensors noise covariances

aFilter = ahrsfilter('SampleRate',iOSDevice.SampleRate); 
aFilter.GyroscopeNoise          = 0.0002;
aFilter.AccelerometerNoise      = 0.0003;
aFilter.LinearAccelerationNoise = 0.0025;
aFilter.MagnetometerNoise       = 0.1;
aFilter.MagneticDisturbanceNoise = 0.9;
aFilter.MagneticDisturbanceDecayFactor = 0.5;
end