function [maps] = simulateSlam(map,trajectory, options)
%SIMULATESLAM Generates map data, slam would output ideally.
% inputs: map: vector of cones (x, y, type)
%         trajectory: trajectory of vehicle (x,y,theta)
%         options: select noise model parameters
%   Detailed explanation goes here
% output: a map for every point in trajectory
    cmap =[];
    
    for i=1:length(trajectory)
        cmap = simulateSlamOneStep(map, cmap, trajectory(i,:), options);
        maps{i} = cmap;
    end
end

