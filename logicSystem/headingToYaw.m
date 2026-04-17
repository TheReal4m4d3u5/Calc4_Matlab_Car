function yaw = headingToYaw(heading)
    switch heading
        case 0  % east
            yaw = pi;
        case 1  % south
            yaw = pi/2;
        case 2  % west
            yaw = 0;
        case 3  % north
            yaw = 3*pi/2;
    end
end