function DP = applyCarTransform(carBase, tx, ty, tz, x, y, z, sx, sy, sz)
    S = scalingMatrix(sx, sy, sz);
    T = translationMatrix(tx, ty, tz);
    Rx = rotationXMatrix(x);
    Ry = rotationYMatrix(y);
    Rz = rotationZMatrix(z);

    DP = T * Rx * Ry * Rz * S * carBase;
end