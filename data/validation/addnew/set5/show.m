function show(name,way)
str = name;
% show the distance
load(str)
for i = 1:size(left,1)
    for j = 1:size(left,1)
        if i~=j
            ar(i,j)=sqrt((left(i,1)-left(j,1))^2+(left(i,2)-left(j,2))^2);
        end
    end
end
for i = 1:size(right,1)
    for j = 1:size(right,1)
        if i~=j
            ag(i,j)=sqrt((right(i,1)-right(j,1))^2+(right(i,2)-right(j,2))^2);
        end
    end
end
ar
ag
%plot in figures
plot(left(:,1),left(:,2),['r' way '*'])
for i = 1:size(left,1)
    c = ['',num2str(i)];
    text(left(i,1),left(i,2),c)
end
hold on

plot(right(:,1),right(:,2),['g' way 'o'])
for i = 1:size(right,1)
    c = ['',num2str(i)];
    text(right(i,1),right(i,2),c)
end

plot(position(1,1),position(1,2),'bs')
% title(str)
end