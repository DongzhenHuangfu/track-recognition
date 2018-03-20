function [left,right,enddirection] = generate(oldlefts, oldrights, direction, numberleft,numberright, maxdistance, mindistance, maxangle, minangle, maxwidth, minwidth, generation, seperate)

% generate the left cones set
cone_distance_left = rand(1,numberleft)*(maxdistance-mindistance) + mindistance;
cone_direction_left = rand(1,numberleft)*(maxangle-minangle) + minangle;

 for i = 1:numberleft
     if i==1 
         angle_left(i) = mod(direction + cone_direction_left(i),2*pi);
         left(i,1) = oldlefts(size(oldlefts,1),1) + cos(angle_left(i))*cone_distance_left(i);
         left(i,2) = oldlefts(size(oldlefts,1),2) + sin(angle_left(i))*cone_distance_left(i);
     else
         angle_left(i) = mod(cone_direction_left(i) + angle_left(i-1),2*pi);
         left(i,1) = left((i-1),1) + cos(angle_left(i))*cone_distance_left(i);
         left(i,2) = left((i-1),2) + sin(angle_left(i))*cone_distance_left(i);
     end
     left(i,3) = 10*generation + i;
 end
 % generate the right cones set
 width = rand(1,numberright)*(maxwidth-minwidth) + minwidth;
 
 if seperate == 1
     error('not finished')
 else
     if numberright ~= numberleft
         error('number of both side should be the same, otherwise please use the seperate mode(seperat ~= 1)')
     end
     for i = 1:numberright
         right(i,1) = left(i,1) + cos(angle_left(i)-0.5*pi)*width(i);
         right(i,2) = left(i,2) + sin(angle_left(i)-0.5*pi)*width(i);
         right(i,3) = 10*generation + i + 1;
     end
 end

  enddirection = angle_left(numberleft);
end