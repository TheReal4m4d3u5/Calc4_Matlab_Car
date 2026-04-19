function [tx1, tz1, state] = runMove(moveType, tx1, tz1, state, cfg, buildings, A, B)




if strcmp(moveType, 'straight')
    [tx1, tz1, state] = runStraightMove(tx1, tz1, state, cfg, buildings, A, B);
elseif strcmp(moveType, 'right')
    [tx1, tz1, state] = runTurnMove('right', tx1, tz1, state, cfg, buildings, A, B);
elseif strcmp(moveType, 'left')
    [tx1, tz1, state] = runTurnMove('left', tx1, tz1, state, cfg, buildings, A, B);
end

end
