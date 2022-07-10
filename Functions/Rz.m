function Rz = Rz(rotZ)
    
        Rz = [cos(rotZ) -sin(rotZ) 0;
             sin(rotZ)  cos(rotZ) 0;
              0        0     1;];

end