function [xWorld, zWorld] = gridToWorld(row, col, blockSize)
    xWorld = 15 + (col - 1) * blockSize;
    zWorld = 0 - (row - 1) * blockSize;
end