% load map data from hockenheim as well as test trajectory
load('slam_simu_data_hockenheim_dv.mat');

% coordinate system may be wrong in all simu scripts

%% generate maps for each point on the trajectory

options.maxdistance = 10;   % maximum distance in [m] we can observe with our sensors
options.fov = deg2rad(100); % field of view of vehicle sensors 

maps = simulateSlam(map_truth, trajectory, options);
% include true map in the figures?
plot_map = 1;

%%
figure
vdt =0.3; % seconds to wait for next trajectory step, <0: click in figure for next step
for i=1:length(maps)


% plot grund truth map
    hold off

if plot_map
    scatter(map_truth(:,2), map_truth(:,3))
    hold on
end

cmap = maps{i};

%plot car position
%scatter(trajectory(i,1), trajectory(i,2), 'x')
quiver(trajectory(i,1), trajectory(i,2), cos(trajectory(i,3))*3, sin(trajectory(i,3))*3)
hold on
if ~isempty(cmap)
scatter(cmap(:,2), cmap(:,3))
end

if vdt < 0
    pause()
else 
    pause(vdt)
end

end