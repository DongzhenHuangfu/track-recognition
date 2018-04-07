% set parameter
close all
clear
clc
setname = '6';
dataname = ['data' setname '0'];
reposname = ['set' setname '/'];
conenumber = 10;
maxradius = 50;
minradius = 26;
maxdistance = 9;
mindistance = 8;
maxtrackwidth = 9;
mintrackwidth = 5;
starting_distance = 3;
breaking_position = [5 6 10 11];
% seperate_list = [4 6 8 10 12 ];
continuous_bad_cones = 2 ;
%generate cones
load('data1');

radiusleft = rand(1,conenumber)*(maxradius-minradius)+minradius;
distance = rand(1,conenumber)*(maxdistance-mindistance)+mindistance;
trackwidth = rand(1,conenumber)*(maxtrackwidth-mintrackwidth)+mintrackwidth;
radiusright = radiusleft + trackwidth;
distance = [starting_distance distance];

angle_left = findangle(radiusleft,distance);
angle_right = angle_left;
distanceright = distance(2:conenumber+1);
for i = 1:conenumber
    distanceleft(i) = distance(i+1)*(radiusleft(i)/radiusright(i));
end

right(2,2) = left(2,2)*(radiusright(1)/radiusleft(1));

for i = 1:conenumber
    left(i+2,1) = left(i+1,1) + distanceleft(i)*cos(angle_left(i));
    left(i+2,2) = left(i+1,2) + distanceleft(i)*sin(angle_left(i));
    left(i+2,3) = 10 + i;
    right(i+2,1) = right(i+1,1) + distanceright(i)*cos(angle_right(i));
    right(i+2,2) = right(i+1,2) + distanceright(i)*sin(angle_right(i));
    right(i+2,3) = 50 + i;
end

save([dataname '_origin.mat'],'left','right','position')

left = left(1:2,:,:);
right = right(1:2,:,:);
save([reposname 'data1.mat'], 'left', 'right', 'position')

[left,right] = generate_badcones([dataname '_origin'], breaking_position, continuous_bad_cones, mindistance, reposname);

% save([reposname 'data2.mat'],'left','right','position')


% seperate([reposname  dataname], seperate_list, reposname);