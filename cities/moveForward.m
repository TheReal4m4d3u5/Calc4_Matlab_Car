function [newRow, newCol] = moveForward(row, col, heading)
newRow = row;
newCol = col;

switch heading
    case 'E'
        newCol = col + 1;
    case 'W'
        newCol = col - 1;
    case 'N'
        newRow = row + 1;
    case 'S'
        newRow = row - 1;
end
end