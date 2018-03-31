%% define parameters
% everytime remember to change the first three parameters
close all
clear
clc
generation = 8;
number = 6;
str_old = ['data',num2str(generation)];
str_new = ['data',num2str(generation +1)];
load([str_old '_desire.mat'])
oldlefts = left;
oldrights = right;
direction = enddirection(size(enddirection,1));
numberleft = number;
numberright = number;
maxdistance = 15;
mindistance = 5;
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
% saveas(1,['pictures/' str_new '_desire.jpg'])
saveas(2,['pictures/' str_new '_input.jpg'])

%% draw the desire pictures
draw_desire(str_new,35)