function [tx1, tz1] = gridToWorld(row, col, y, tz2)

tx1 = 0;
tz1 = 0;

if y == 0 && tz2 == 0
    if row == -1, tz1 = 0; end
    if row == 0,  tz1 = 0;   end
    if row == 1,  tz1 = 0;  end
    if row == 2,  tz1 = 0;  end

    if col == -0.5, tx1 = 0; end
    if col ==  0.5, tx1 = 0;   end
    if col ==  1.5, tx1 = 0;  end
end

if y == pi && tz2 == 0
    if row == -1, tz1 = 0; end
    if row == 0,  tz1 = 0; end
    if row == 1,  tz1 = 0;  end
    if row == 2,  tz1 = 0;  end

    if col == -0.5, tx1 = 0; end
    if col ==  0.5, tx1 = 0;   end
    if col ==  1.5, tx1 = 0;  end
end

if y == pi/2 && tz2 == 0
    if col == -1, tx1 = 0; end
    if col ==  0, tx1 = 0; end
    if col ==  1, tx1 = 0;   end
    if col ==  2, tx1 = 0;  end

    if row == -0.5, tz1 = 0; end
    if row ==  0.5, tz1 = 0;  end
    if row ==  1.5, tz1 = 0;  end
end

if y == 3*pi/2 && tz2 == 0
    if col == -1, tx1 = 0; end
    if col ==  0, tx1 = 0;   end
    if col ==  1, tx1 = 0;  end
    if col ==  2, tx1 = 0;  end

    if row == -0.5, tz1 = 0; end
    if row ==  0.5, tz1 = 0;  end
    if row ==  1.5, tz1 = 0;  end
end

if y == 0 && tz2 == 30
    if row == -1, tz1 = 0; end
    if row == 0,  tz1 = 0; end
    if row == 1,  tz1 = 0;   end
    if row == 2,  tz1 = 0;  end

    if col == -0.5, tx1 = 0; end
    if col ==  0.5, tx1 = 0;   end
    if col ==  1.5, tx1 = 0;  end
end

if y == pi && tz2 == 30
    if row == -1, tz1 = 0; end
    if row == 0,  tz1 = 0;   end
    if row == 1,  tz1 = 0;  end
    if row == 2,  tz1 = 0;  end

    if col == -0.5, tx1 = 0; end
    if col ==  0.5, tx1 = 0;   end
    if col ==  1.5, tx1 = 0;  end
end

if y == pi/2 && tz2 == 30
    if col == -1, tx1 = 0; end
    if col ==  0, tx1 = 0;   end
    if col ==  1, tx1 = 0;  end
    if col ==  2, tx1 = 0;  end

    if row == -0.5, tz1 = 0; end
    if row ==  0.5, tz1 = 0;   end
    if row ==  1.5, tz1 = 0;  end
end

if y == 3*pi/2 && tz2 == 30
    if col == -1, tx1 = 0; end
    if col ==  0, tx1 = 0; end
    if col ==  1, tx1 = 0;   end
    if col ==  2, tx1 = 0;  end

    if row == -0.5, tz1 = 0; end
    if row ==  0.5, tz1 = 0;  end
    if row ==  1.5, tz1 = 0;  end
end

end