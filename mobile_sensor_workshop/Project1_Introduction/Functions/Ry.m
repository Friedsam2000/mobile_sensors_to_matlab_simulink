function Ry = Ry(rotY)
    
        Ry = [cos(rotY) 0 sin(rotY);
              0         1       0;
             -sin(rotY) 0 cos(rotY)];

end