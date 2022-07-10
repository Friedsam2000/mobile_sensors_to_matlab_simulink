clc
init_cam
clear cam
cam = camera(m,'front');
img = snapshot(cam,'immediate');
image(img)

