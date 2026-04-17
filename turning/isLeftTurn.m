function tf = isLeftTurn(oldHeading, newHeading)
tf = strcmp(turnLeft(oldHeading), newHeading);
end