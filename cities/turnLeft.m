function newHeading = turnLeft(heading)
switch heading
    case 'E'
        newHeading = 'N';
    case 'N'
        newHeading = 'W';
    case 'W'
        newHeading = 'S';
    case 'S'
        newHeading = 'E';
end
end