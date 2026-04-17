function [row, col, heading, currentPos] = driveStep( ...
    moveNum, row, col, heading, currentPos, ...
    roadX, roadZ, zOffset, ...
    Car0, BaseBuildings, Acar, Abuild, ...
    b, c, d, wxmin, wxmax, wymin, wymax, ...
    pse, moveFramesBase, turnFrames, preTurnDistance)

[actions, nextHeadings] = getValidActions(row, col, heading);

actionIdx = randi(length(actions));
action = actions{actionIdx};
newHeading = nextHeadings{actionIdx};

oldRow = row;
oldCol = col;

% use actual current displayed position as start
p0 = currentPos;

[row, col] = moveForward(oldRow, oldCol, newHeading);

newSx = roadX(col);
newSz = -roadZ(row) + zOffset;
p1 = [newSx; newSz];

fprintf('Move %d: %s   heading=%s   row=%d col=%d   sx=%.2f sz=%.2f\n', ...
    moveNum, action, newHeading, row, col, newSx, newSz);

moveDistance = norm(p1 - p0);
baseDistance = 35;
moveFrames = max(12, round(moveFramesBase * moveDistance / baseDistance));

p = p0;

% ==========================================================
% STRAIGHT
% ==========================================================
if strcmp(action, 'straight')

    moveFrames = max(moveFrames, 16);

    dir0 = headingVector(heading);
    yInterp = vecToYaw(dir0(1), dir0(2));

    for f = 1:moveFrames
        t = f / moveFrames;
        a = smoothstep(t);

        p = (1 - a) * p0 + a * p1;

        Car = getCarTransform(Car0, 0, 0, yInterp);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end

% ==========================================================
% TURN
% ==========================================================
else
    dir0 = headingVector(heading);

    % independent controls
    leadDist = preTurnDistance;
    turnRadius = 8;   % make smaller for tighter turn

    % do not let lead-in go too far
    leadDist = min(leadDist, 0.35 * moveDistance);

    pLead = p0 + leadDist * dir0;

    straightFrames = max(4, round(moveFrames * 0.20));
    turnOnlyFrames = max(turnFrames, round(moveFrames * 0.55));
    exitFrames = max(4, moveFrames - straightFrames - turnOnlyFrames);

    % --- lead-in before turn ---
    leadYaw = vecToYaw(dir0(1), dir0(2));

    for f = 1:straightFrames
        t = f / straightFrames;
        a = smoothstep(t);

        p = (1 - a) * p0 + a * pLead;

        Car = getCarTransform(Car0, 0, 0, leadYaw);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end

    % --- turn geometry ---
    y0 = headingToYaw(heading);
    y1 = headingToYaw(newHeading);
    leftTurn = isLeftTurn(heading, newHeading);

    if leftTurn
        turnSign = -1;
        center = pLead + leftNormal(dir0) * turnRadius;
    else
        turnSign = 1;
        center = pLead + rightNormal(dir0) * turnRadius;
    end

    startVec = pLead - center;

    for f = 1:turnOnlyFrames
        t = f / turnOnlyFrames;
        a = smoothstep(t);

        theta = turnSign * (pi/2) * a;
        R = rot2(theta);

        v = R * startVec;
        p = center + v;

        yInterp = y0 - theta;

        Car = getCarTransform(Car0, 0, 0, yInterp);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end

    % --- short exit after turn ---
    pTurnEnd = p;
    for f = 1:exitFrames
        t = f / exitFrames;
        a = smoothstep(t);

        p = (1 - a) * pTurnEnd + a * p1;

        Car = getCarTransform(Car0, 0, 0, y1);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end
end

% snap logical state to exact target intersection
currentPos = p1;
heading = newHeading;
end