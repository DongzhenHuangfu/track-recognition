function [map] = simulateSlamOneStep(map_truth,map_current, pose, options)
%SIMULATESLAM Generates map data, slam would output ideally.
% inputs: map_truth: vector of cones (id, x, y, type)
%         map_current: vector of cones (id, x, y, type), current state of slam
%         map
%         pose: (x, y, theta) current pose of vehicle
%         options: select noise model parameters
%   type: 1=left, 2=right (check with E7000 convention)
% output: new slam map

%% calculate cones in view of vehicle
distances_sqr = (pose(1)-map_truth(:,2)).^2 + (pose(2) - map_truth(:,3)).^2;
angle = atan2(map_truth(:,3)-pose(2),map_truth(:,2)-pose(1)) -mod(pose(3),2*pi);  % relative to vehicle


cones_in_view = (distances_sqr < options.maxdistance^2 & (abs(angle) < options.fov/2)); % logical index

%% add or remove cones in view to vehicle from/to the map

% todo:  add noise to cone positions, exclude/include cones from map,
% change type randomly
map = map_current;

ids = map_truth(cones_in_view,1);
for i=1:length(ids)
    if isempty(map)
       index = 0;
    else
       index = find(map(:,1)==ids(i), 1);
    end
    if(index>0)
        % cone exists in current map
        % do something, e.g. add noise
    else
        % add cone to map
        map = [map;map_truth(ids(i),:)];
    end

% add noise to cone positions



end

