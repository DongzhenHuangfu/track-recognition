function radius = findradius(str)
load(str)
    for i = 1:size(left,1)-2
        x1 = left(i,1);
        y1 = left(i,2);
        x2 = left(i+1,1);
        y2 = left(i+1,2);
        x3 = left(i+2,1);
        y3 = left(i+2,2);
        m1 = (x1*y2 - x2*y1 - x1*y3 + x3*y1 + x2*y3 - x3*y2)^2;
        m2 = x1^2 - 2*x1*x2 + x2^2 + y1^2 - 2*y1*y2 + y2^2;
        m3 = x1^2 - 2*x1*x3 + x3^2 + y1^2 - 2*y1*y3 + y3^2;
        m4 = x2^2 - 2*x2*x3 + x3^2 + y2^2 - 2*y2*y3 + y3^2;
        m5 = (x1*y2 - x2*y1 - x1*y3 + x3*y1 + x2*y3 - x3*y2)^2;
        if m5 < 10^(-10)
            radius(i) = 999;
        else
            radius(i) = (m1*m2*m3*m4)^(1/2)/(2*m5);
    end
end