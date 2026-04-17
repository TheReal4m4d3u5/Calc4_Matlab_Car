function n = rightNormal(v)

    if numel(v) ~= 2
        error('rightNormal: input must be 2-element vector, got size %s', mat2str(size(v)));
    end

    v = v(:); % force column vector

    n = [-v(2); v(1)];
end