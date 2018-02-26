for i=1:length(trajectory)-1
    angle(i) = atan2(trajectory(i+1,2)-trajectory(i,2), trajectory(i+1,1)-trajectory(i,1))
end
