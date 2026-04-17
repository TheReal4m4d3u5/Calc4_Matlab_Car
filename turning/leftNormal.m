function n = leftNormal(v)

    if numel(v) ~= 2
        error('leftNormal: input must be 2-element vector, got size %s', mat2str(size(v)));
    end

    v = v(:);

    n = [v(2); -v(1)];
end