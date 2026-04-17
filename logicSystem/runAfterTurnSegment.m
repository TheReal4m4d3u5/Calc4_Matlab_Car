function runAfterTurnSegment(Car0, BaseBuildings, Acar, Abuild, ...
    b, c, d, wxmin, wxmax, wymin, wymax, pse, turnX, turnRadius)

    for tz = -(turnRadius + 1):-1:-55
        tx = turnX + turnRadius;
        y = pi/2;

        Car = getCarTransform(Car0, 0, 0, y);
        Buildings = shiftWorld(BaseBuildings, -tx, -tz);

        drawSceneFixed(Car, Buildings, Acar, Abuild, ...
            b, c, d, wxmin, wxmax, wymin, wymax);
        pause(pse)
    end
end