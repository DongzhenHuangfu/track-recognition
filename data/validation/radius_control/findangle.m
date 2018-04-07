function angle = findangle(radius, distance)

for i = 1:size(radius,2)
    theta1 = acos(distance(i)/2/radius(i));
    theta2 = acos(distance(i+1)/2/radius(i));
    turning_angle(i) = pi -theta1-theta2;
end
angle(1) = 0.5*pi+turning_angle(1);
for i = 2:size(radius,2)
    angle(i) = angle(i-1) + turning_angle(i);
end
end