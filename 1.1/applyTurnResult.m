function [row, col, newY] = applyTurnResult(row, col, startY, turnDir)



oldRow = row;
oldCol = col;

startY = mod(startY, 2*pi);

if strcmp(turnDir, 'left')
    if startY == 0
        col = col - 0.5;
        row = row - 0.5;
    elseif startY == pi/2
        col = col + 0.5;
        row = row - 0.5;
    elseif startY == pi
        col = col + 0.5;
        row = row + 0.5;
    else
        col = col - 0.5;
        row = row + 0.5;
    end

    newY = mod(startY + pi/2, 2*pi);

else
    if startY == 0
        col = col - 0.5;
        row = row + 0.5;
    elseif startY == pi/2
        col = col - 0.5;
        row = row - 0.5;
    elseif startY == pi
        col = col + 0.5;
        row = row - 0.5;
    else
        col = col + 0.5;
        row = row + 0.5;
    end

    newY = mod(startY - pi/2, 2*pi);
end


end