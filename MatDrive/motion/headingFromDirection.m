function phi = headingFromDirection(direction)
    phi = pi + atan2(direction(3), direction(1));
end