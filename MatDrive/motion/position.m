function p = position(theta)
    p = [
        50 * cos(theta);
        0;
        40 * sin(2 * theta)
    ];
end