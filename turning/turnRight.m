function newHeading = turnRight(heading)
switch heading
    case 'E'
        newHeading = 'S';
    case 'S'
        newHeading = 'W';
    case 'W'
        newHeading = 'N';
    case 'N'
        newHeading = 'E';
end
end