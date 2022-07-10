%In Order to safe system ressources, please comment out the Sensors you
%currently dont need in Simulink

%Orientation Sensor
set_param('sensor_model_simulink/Azimuth','Value',num2str(m.Orientation(1)));
set_param('sensor_model_simulink/Pitch','Value',num2str(m.Orientation(2)));
set_param('sensor_model_simulink/Roll','Value',num2str(m.Orientation(3)));

%Magnetic Sensor
% set_param('sensor_model_simulink/X_mag','Value',num2str(m.MagneticField(1)));
% set_param('sensor_model_simulink/Y_mag','Value',num2str(m.MagneticField(2)));
% set_param('sensor_model_simulink/Z_mag','Value',num2str(m.MagneticField(3)));

%Acceleration Sensor
% set_param('sensor_model_simulink/X_acc','Value',num2str(m.Acceleration(1)));
% set_param('sensor_model_simulink/Y_acc','Value',num2str(m.Acceleration(2)));
% set_param('sensor_model_simulink/Z_acc','Value',num2str(m.Acceleration(3)));

%Angular Velocity Sensor
% set_param('sensor_model_simulink/X_ang','Value',num2str(m.AngularVelocity(1)));
% set_param('sensor_model_simulink/Y_ang','Value',num2str(m.AngularVelocity(2)));
% set_param('sensor_model_simulink/Z_ang','Value',num2str(m.AngularVelocity(3)));

%Position Sensor
% set_param('sensor_model_simulink/X_ang','Value',num2str(m.Latitude));
% set_param('sensor_model_simulink/Longitude','Value',num2str(m.Longitude));
% set_param('sensor_model_simulink/Speed','Value',num2str(m.Speed));
% set_param('sensor_model_simulink/Course','Value',num2str(m.Course));
% set_param('sensor_model_simulink/Altitude','Value',num2str(m.Altitude));
% set_param('sensor_model_simulink/HorizontalAccuracy','Value',num2str(m.HorizontalAccuracy));

%Dont comment this out
set_param('sensor_model_simulink','SimulationCommand','continue');
