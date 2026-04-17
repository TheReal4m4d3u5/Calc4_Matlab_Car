function y = headingToYaw(heading)
switch heading
    case 'E'
        y = 0;
    case 'W'
        y = pi;
    case 'N'
        y = pi/2;
    case 'S'
        y = -pi/2;
end
end