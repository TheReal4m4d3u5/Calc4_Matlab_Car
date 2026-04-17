function nextHeading = chooseNextDirection(row, col, heading)

    straight = heading;
    leftTurn = mod(heading + 3, 4);
    rightTurn = mod(heading + 1, 4);

    straightValid = isValidMove(row, col, straight);
    leftValid = isValidMove(row, col, leftTurn);
    rightValid = isValidMove(row, col, rightTurn);

    if straightValid
        choices = [];

        if leftValid
            choices(end+1) = leftTurn;
        end

        choices(end+1) = straight;

        if rightValid
            choices(end+1) = rightTurn;
        end
    else
        % must turn
        choices = [];

        if leftValid
            choices(end+1) = leftTurn;
        end

        if rightValid
            choices(end+1) = rightTurn;
        end
    end

    idx = randi(length(choices));
    nextHeading = choices(idx);
end