function [actions, nextHeadings] = getValidActions(row, col, heading, maxRow, maxCol)

actions = {};
nextHeadings = {};

% Try right turn first
rightHeading = turnRight(heading);
[newRow, newCol] = moveForward(row, col, rightHeading);

if newRow >= 1 && newRow <= maxRow && newCol >= 1 && newCol <= maxCol
    actions = {'right'};
    nextHeadings = {rightHeading};
    return;
end

% Fallback: straight
straightHeading = heading;
[newRow, newCol] = moveForward(row, col, straightHeading);

if newRow >= 1 && newRow <= maxRow && newCol >= 1 && newCol <= maxCol
    actions = {'straight'};
    nextHeadings = {straightHeading};
    return;
end

% Final fallback: left
leftHeading = turnLeft(heading);
[newRow, newCol] = moveForward(row, col, leftHeading);

if newRow >= 1 && newRow <= maxRow && newCol >= 1 && newCol <= maxCol
    actions = {'left'};
    nextHeadings = {leftHeading};
    return;
end

% Stay in place if nothing valid
actions = {'straight'};
nextHeadings = {heading};
end