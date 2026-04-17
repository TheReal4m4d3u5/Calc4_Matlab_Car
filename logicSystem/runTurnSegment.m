function runTurnSegment(Car0, BaseBuildings, Acar, Abuild, ...
    b, c, d, wxmin, wxmax, wymin, wymax, pse, turnX, turnRadius)

    for theta = (pi/24):(pi/24):(pi/2)
        tx = turnX + turnRadius * (1 - cos(theta));
        tz = -turnRadius * sin(theta);
        y  = pi - theta;

        Car = getCarTransform(Car0, 0, 0, y);
        Buildings = shiftWorld(BaseBuildings, -tx, -tz);

        drawSceneFixed(Car, Buildings, Acar, Abuild, ...
            b, c, d, wxmin, wxmax, wymin, wymax);
        pause(pse)
    end
end