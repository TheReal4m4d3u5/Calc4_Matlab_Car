function v = headingVector(heading)

    switch heading
        case 'E'
            v = [1; 0];
        case 'W'
            v = [-1; 0];
        case 'N'
            v = [0; -1];
        case 'S'
            v = [0; 1];
        otherwise
            error('Invalid heading: %s', heading);
    end

end