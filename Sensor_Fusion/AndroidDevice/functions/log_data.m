function [AndroidPhone,a,ta,w,tw,m,tm,oin,to] = log_data(AndroidPhone,loggingTime)
%Log 'loggingTime' seconds of phone sensor data
%   Tipp: use the magfieldlog function to log the magnetometer data

AndroidPhone.Logging = 1;
pause(loggingTime);
[a, ta] = accellog(AndroidPhone);
[w, tw] = angvellog(AndroidPhone);
[m, tm] = magfieldlog(AndroidPhone); 
[oin, to] = orientlog(AndroidPhone); 

end