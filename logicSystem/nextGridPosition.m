function [nextRow, nextCol] = nextGridPosition(row, col, heading)

    nextRow = row;
    nextCol = col;

    switch heading
        case 0 % east
            nextCol = col + 1;
        case 1 % south
            nextRow = row + 1;
        case 2 % west
            nextCol = col - 1;
        case 3 % north
            nextRow = row - 1;
    end
end