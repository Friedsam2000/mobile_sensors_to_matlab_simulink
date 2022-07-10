function [] = plot_path(X,i)


    %% Draw the smartphones movement using the IMU
    


    room_size = 0.005;

    if i > 20
        plot3(X(1,i-10:i),X(2,i-10:i),X(3,i-10:i));
        axis([X(1,i)-room_size X(1,i)+room_size X(2,i)-room_size  X(2,i)+room_size X(3,i)-room_size  X(3,i)+room_size]);
        grid on
        drawnow
    end

end

