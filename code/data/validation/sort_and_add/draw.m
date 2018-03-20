%% define parameters
% everytime remember to change the first three parameters
clear
clc
generation = 8;
str_old = 'data8';
str_new = 'data9';
load([str_old '_desire.mat'])
oldlefts = left;
oldrights = right;
direction = enddirection(size(enddirection,1));
numberleft = 2;
numberright = 2;
maxdistance = 5;
mindistance = 3;
maxangle = 0.125*pi;
minangle = -0.125*pi;
maxwidth = 7;
minwidth = 5;
seperate = 0;

%% generate new cones
[newleft,newright,newdirection] = generate(oldlefts, oldrights, direction, numberleft,numberright, maxdistance, mindistance, maxangle, minangle, maxwidth, minwidth, generation, seperate);

%% generate the desired pictures
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