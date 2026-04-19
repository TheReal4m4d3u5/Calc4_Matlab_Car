function [moveType, tz2] = chooseMove(~)

r = randi(3,1);

if r == 1
    moveType = 'straight';
    tz2 = 0;
elseif r == 2
    moveType = 'left';
    tz2 = 0;
else
    moveType = 'right';
    tz2 = 0;
end

end