function R = getR(yaw,pitch,roll)
R = Rz(pi/2) * inv(Rz(yaw)*Ry(pitch)*Rx(roll));
end

