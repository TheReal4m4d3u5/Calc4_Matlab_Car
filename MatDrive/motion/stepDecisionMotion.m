function [state, finished] = stepDecisionMotion(state, cfg)
    finished = false;

    switch state.decision
        case 1
            if state.mode == "turning"
                state.y = state.y - cfg.inc;
                if state.y <= pi/2
                    state.y = pi/2;
                    state.mode = "straight";
                    state.decision = 2;
                    state.count = 0;
                end
            end

        case 2
            state.count = state.count + cfg.inc2;
            state.tx = min(state.tx + cfg.inc2, 30);
            if state.tx >= 30
                state.decision = 3;
                state.mode = "turning";
                state.turnTarget = 0;
            end

        case 3
            state.y = state.y - cfg.inc;
            if state.y <= 0
                state.y = 0;
                state.decision = 4;
            end

        case 4
            state.tz = state.tz + cfg.inc2;
            if state.tz >= 0
                state.tz = 0;
                state.decision = 5;
            end

        case 5
            state.y = state.y - cfg.inc;
            if state.y <= -pi/2
                state.y = -pi/2;
                state.decision = 6;
            end

        case 6
            state.tx = state.tx + cfg.inc2;
            if state.tx <= 0
                state.tx = 0;
                finished = true;
            end
    end
end