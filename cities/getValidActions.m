function [actions, nextHeadings] = getValidActions(row, col, heading)

% Force only right turns (no validation for now)
actions = {'right'};
nextHeadings = {turnRight(heading)};

end