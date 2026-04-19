function [row, col, array] = wrapState(row, col, array)

if row < -1
    row = 1.5;
end
if row > 2
    row = -0.5;
end

if col < -1
    col = 1.5;
    array = 1;
end
if col > 2
    col = -0.5;
    array = -1;
end

if array < -1
    array = 1;
end
if array > 1
    array = -1;
end

end