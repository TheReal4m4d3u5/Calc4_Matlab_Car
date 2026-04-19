function newY = predictHeading(currentY, moveType)

if strcmp(moveType, 'straight')
    newY = currentY;
elseif strcmp(moveType, 'left')
    newY = currentY + pi/2;
elseif strcmp(moveType, 'right')
    newY = currentY - pi/2;
else
    newY = currentY;
end

newY = mod(newY, 2*pi);

end