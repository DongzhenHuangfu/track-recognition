%% define parameters
% everytime remember to change the first three parameters
close all
clear
clc
generation = 1;
number = 12;
str_old = ['data',num2str(generation)];
str_new = ['data',num2str(generation +1)];
load([str_old '_desire.mat'])
oldlefts = left;
oldrights = right;
direction = enddirection(size(enddirection,1));
numberleft = number;
numberright = number;
maxdistance = 15;
mindistance = 11;
maxangle = 0.125*pi;
minangle = -0.125*pi;
maxwidth = 7;
minwidth = 5;
seperate = 0;

% generate new cones
[newleft,newright,newdirection] = generate(oldlefts, oldrights, direction, numberleft,numberright, maxdistance, mindistance, maxangle, minangle, maxwidth, minwidth, generation, seperate);

% generate the desired pictures
left = [left; newleft];
right = [right; newright];
enddirection = [enddirection, newdirection];
save([str_new '_desire.mat'],'left','right', 'position','enddirection')
show([str_new '_desire'],'-')
figure()
load([str_old '.mat'])
newleft = chaos(newleft);
newright = chaos(newright);
left = [left; newleft];
right = [right; newright];
save([str_new '.mat'],'left','right', 'position')
show(str_new,'')

saveas(2,['pictures/' str_new '_input.jpg'])

%% generate new input
close all

str_sta = ['data',num2str(generation +2)];

load([str_new '_desire.mat'])

left_draw(1:11,:,:) = left(1:11,:,:);
right_draw(1:11,:,:) = right(1:11,:,:);

for i = 12:size(left,1)
    left_new(i-11,1) = 0.5*(left(i-1,1)+left(i,1));
    left_new(i-11,2) = 0.5*(left(i-1,2)+left(i,2));
    left_new(i-11,3) = 2000 + i;
    left_draw(12+2*(i-12),1) = left_new(i-11,1);
    left_draw(13+2*(i-12),1) = left(i,1);
    left_draw(12+2*(i-12),2) = left_new(i-11,2);
    left_draw(13+2*(i-12),2) = left(i,2);
    left_draw(12+2*(i-12),3) = left_new(i-11,3);
    left_draw(13+2*(i-12),3) = left(i,3);
end

for j = 12:size(right,1)
    right_new(j-11,1) = 0.5*(right(j-1,1)+right(j,1));
    right_new(j-11,2) = 0.5*(right(j-1,2)+right(j,2));
    right_new(j-11,3) = 3000 + j;
    right_draw(12+2*(j-12),1) = right_new(j-11,1);
    right_draw(13+2*(j-12),1) = right(j,1);
    right_draw(12+2*(j-12),2) = right_new(j-11,2);
    right_draw(13+2*(j-12),2) = right(j,2);
    right_draw(12+2*(j-12),3) = right_new(j-11,3);
    right_draw(13+2*(j-12),3) = right(j,3);
end

left = left_draw;
right = right_draw;
save([str_sta '_desire.mat'],'left','right', 'position');
show([str_sta '_desire'],'-')
saveas(1,['pictures/' str_sta '_desire.jpg'])

figure()

load([str_new '.mat'])

left_new = chaos(left_new);
right_new = chaos(right_new);

left = [left;left_new];
right = [right;right_new];
save([str_sta '_sta.mat'],'left','right', 'position');
show([str_sta '_sta'],'')
saveas(2,['pictures/' str_sta '_input.jpg'])