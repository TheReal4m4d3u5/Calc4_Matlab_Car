function valid = isValidMove(row, col, heading)
    [r, c] = nextGridPosition(row, col, heading);
    valid = (r >= 1 && r <= 4 && c >= 1 && c <= 4);
end