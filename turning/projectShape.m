function projectShape(D, A, b, c, d, lineSpec)
P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0    0;
     0 0 -1/d 1];

Dpro = P * D;
w = Dpro(4,:);

if any(w <= 0.15)
    return;
end

GP = Dpro(1:3,:) ./ [w; w; w];
G2 = transpose(GP(1:2,:));

gplot(A, G2, lineSpec);
end