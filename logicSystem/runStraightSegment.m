function runStraightSegment(Car0, BaseBuildings, Acar, Abuild, ...
    b, c, d, wxmin, wxmax, wymin, wymax, pse)

    for tx = -50:1:25
        tz = 0;
        y = pi;

        Car = getCarTransform(Car0, 0, 0, y);
        Buildings = shiftWorld(BaseBuildings, -tx, -tz);

        drawSceneFixed(Car, Buildings, Acar, Abuild, ...
            b, c, d, wxmin, wxmax, wymin, wymax);
        pause(pse)
    end
end