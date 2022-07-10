function [iOSDevice,a,ta,w,tw,m,tm,oin,to] = log_data_iOS(iOSDevice,loggingTime)
%Log 'loggingTime' seconds of phone sensor data
%   Tipp: use the magfieldlog function to log the magnetometer data

iOSDevice.Logging = 1;
pause(loggingTime);
[a, ta] = accellog(iOSDevice);
[w, tw] = angvellog(iOSDevice);
[m, tm] = magfieldlog(iOSDevice);
[oin, to] = orientlog(iOSDevice);
end