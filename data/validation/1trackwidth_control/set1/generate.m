close all
clear
clc

generation = 8;
max_trackwidth = 1;
min_trackwidth = 0.5;
min_xdistance = 5;
max_xdistance = 10;
dataname = ['data' num2str(generation)];
load(['data' num2str(generation-1) '.mat'])

left_num = round(rand(1)*5);
right_num = round(rand(1)*5);
if size(left,1) - size(right,1) >= 3
    left_num = 0;
elseif size(right,1) - size(left,1) >= 3
        right_num = 0;
end

left_xchange = (max_xdistance-min_xdistance)*rand(1,left_num) + min_xdistance;
left_y = (max_trackwidth-min_trackwidth)*rand(1,left_num) + min_trackwidth;
right_xchange = (max_xdistance-min_xdistance)*rand(1,right_num) + min_xdistance;

for i = 1:size(left_xchange,2)
    left(size(left,1)+1,1) = left(size(left,1), 1) + left_xchange(i);
    left(size(left,1),2) = left_y(i);
    left(size(left,1),3) = left(size(left,1)-1, 3) + 1;
end

for i = 1:size(right_xchange,2)
    right(size(right,1)+1,1) = right(size(right,1), 1) + right_xchange(i);
    right(size(right,1),2) = 0;
    right(size(right,1),3) = right(size(right,1)-1, 3) + 1;
end

save([dataname '.mat'], 'left', 'right', 'position')
show(dataname,'-')