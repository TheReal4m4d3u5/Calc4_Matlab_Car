function [actions, nextHeadings] = getValidActions(row, col, heading)
actions = {};
nextHeadings = {};

straightHeading = heading;
leftHeading = turnLeft(heading);
rightHeading = turnRight(heading);

if canMove(row, col, straightHeading)
    actions{end+1} = 'straight';
    nextHeadings{end+1} = straightHeading;
end

if canMove(row, col, leftHeading)
    actions{end+1} = 'left';
    nextHeadings{end+1} = leftHeading;
end

if canMove(row, col, rightHeading)
    actions{end+1} = 'right';
    nextHeadings{end+1} = rightHeading;
end
end