function [aFilter] = AHRS_filter(AndroidPhone)
%Define the AHRS filter and assign sensors noise covariances

aFilter = ahrsfilter('SampleRate',AndroidPhone.SampleRate); 
aFilter.GyroscopeNoise          = 0.0002;
aFilter.AccelerometerNoise      = 0.0003;
aFilter.LinearAccelerationNoise = 0.0025;
aFilter.MagnetometerNoise       = 0.1;

end