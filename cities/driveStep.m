function [row, col, heading, currentPos] = driveStep( ...
    moveNum, row, col, heading, currentPos, ...
    roadX, roadZ, xOffset, zOffset, ...
    Car0, BaseBuildings, Acar, Abuild, ...
    b, c, d, wxmin, wxmax, wymin, wymax, ...
    pse, moveFramesBase, turnFrames, preTurnDistance, postTurnDistance)

[actions, nextHeadings] = getValidActions(row, col, heading, length(roadZ), length(roadX));

actionIdx = randi(length(actions));
action = actions{actionIdx};
newHeading = nextHeadings{actionIdx};

oldRow = row;
oldCol = col;

p0 = currentPos;

[row, col] = moveForward(oldRow, oldCol, newHeading);

if row < 1 || row > length(roadZ) || col < 1 || col > length(roadX)
    error('Out of bounds: row=%d col=%d', row, col);
end

newSx = roadX(col) + xOffset;
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
    yInterp = vecToYaw(dir0(1), dir0(2)) + pi;

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
    dir1 = headingVector(newHeading);

    leadDist = min(preTurnDistance, 0.45 * moveDistance);
    outDist  = min(postTurnDistance, 0.45 * moveDistance);

    pLead = p0 + leadDist * dir0;
    pOutStart = p1 - outDist * dir1;

    y0 = headingToYaw(heading) + pi;
    y1 = headingToYaw(newHeading) + pi;

    if strcmp(action, 'right')
        turnSign = -1;
        turnNormal = rightNormal(dir0);
    else
        turnSign = 1;
        turnNormal = leftNormal(dir0);
    end

    dp = pOutStart - pLead;
    r0 = dot(dp, dir0);
    r1 = dot(dp, dir1);

    r = min(r0, r1);
    r = max(r, 0);

    center = pLead + turnNormal * r;
    startVec = pLead - center;

    leadLen = norm(pLead - p0);
    arcLen = r * (pi / 2);
    outLen = norm(p1 - pOutStart);

    totalLen = leadLen + arcLen + outLen;
    if totalLen <= 0
        totalLen = 1;
    end

    straightFramesIn  = max(4, round(moveFrames * (leadLen / totalLen)));
    turnOnlyFramesNow = max(turnFrames, round(moveFrames * (arcLen / totalLen)));
    straightFramesOut = max(4, round(moveFrames * (outLen / totalLen)));

    % --- lead-in before turn ---
    leadYaw = vecToYaw(dir0(1), dir0(2)) + pi;

    for f = 1:straightFramesIn
        t = f / straightFramesIn;
        a = smoothstep(t);

        p = (1 - a) * p0 + a * pLead;

        Car = getCarTransform(Car0, 0, 0, leadYaw);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end

    % --- 90-degree turn with correct center ---
    for f = 1:turnOnlyFramesNow
        t = f / turnOnlyFramesNow;
        a = smoothstep(t);

        theta = turnSign * (pi/2) * a;
        R = rot2(theta);

        v = R * startVec;
        p = center + v;

        yInterp = y0 + theta;

        Car = getCarTransform(Car0, 0, 0, yInterp);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end

    % --- lead-out after turn ---
    leadOutOffsetX = 0;
    leadOutOffsetZ = 0;

    pLeadOutStart = pOutStart + [leadOutOffsetX; leadOutOffsetZ];

    for f = 1:straightFramesOut
        t = f / straightFramesOut;
        a = smoothstep(t);

        p = (1 - a) * pLeadOutStart + a * p1;

        Car = getCarTransform(Car0, 0, 0, y1);
        Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse);
    end
end

currentPos = p1;
heading = newHeading;
end