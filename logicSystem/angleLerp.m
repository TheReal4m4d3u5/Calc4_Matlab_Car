function a = angleLerp(a0, a1, t)
    da = atan2(sin(a1 - a0), cos(a1 - a0));  % shortest angular difference
    a = a0 + t * da;
end