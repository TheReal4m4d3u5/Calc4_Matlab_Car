function tf = canMove(row, col, heading)
switch heading
    case 'E'
        tf = col < 4;
    case 'W'
        tf = col > 1;
    case 'N'
        tf = row > 1;
    case 'S'
        tf = row < 4;
    otherwise
        tf = false;
end
end