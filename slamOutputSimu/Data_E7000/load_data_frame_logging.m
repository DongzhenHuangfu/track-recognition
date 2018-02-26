function load_data_from_logging()
    

    cones_x=zeros(1,2);
    cones_y=zeros(1,2);

    % Select mat file 
    [filename, path] = uigetfile('*.mat','Open Logger DB exports');
    filename = fullfile(path, filename);
    logging_data = load(filename);
    log_data = logging_data.data;
    
    % Inconsitent data names
    %logging_data = load('Messdaten/slam_map.mat');
    %log_data = logging_data.data;    
%     logging_data = load('Messdaten/slam-output-for-track-recognition_hrls_20170731.mat');
%     log_data = logging_data.data2;
    
    for n=1:size(logging_data.data,1)
    %for n=36:size(log_data,1)
    %for n=23:50
        
%         disp('##############################################')
%         disp('Iteration')
%         disp(n)
%         disp('##############################################')
        
        % Clear Matlab functions for new iteration
        % Variables should be stored in Code itself
        clf;
        clear functions;
        
        %decodedJsonData = jsondecode(char(logging_data.data.data(n,:)));
        decodedJsonData = jsondecode(char(log_data.data(n,:)));
        
        % Extract car position
        car_pos = decodedJsonData.car_pos(1:2)';
        % Extract yaw angle 
        yaw = decodedJsonData.car_pos(3);
        % Extract cone positions 
        cone_pos = vec2mat(decodedJsonData.cones_pos,4);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Function Call

%        [interp_limits_left, interp_limits_right, left_cone_map, right_cone_map, limits_left_sort, limits_right_sort, start_left_limits, start_right_limits ] = sort_cones([cone_pos(:,1),cone_pos(:,2)],cone_pos(:,3),car_pos,yaw);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Plot area

        % Plot car Position
        plot(car_pos(1),car_pos(2),'x','color','g');
        hold on;
%         car = quiver(car_pos(1), car_pos(2), car_pos_delta_x*3,car_pos_delta_y*3 );
%         car.Color = 'g';
%         car.LineWidth = 1.5;
%         car.Marker = 'x';
%         car.MarkerSize = 7;
%         hold on;

        % Plot map of all cones
        plot(car_pos(1),car_pos(2),'markersize',30);
        hold on;
        plot(cone_pos(:,1),cone_pos(:,2),'*','color',[.5 .5 .5]);
        hold on;
        
        % Plot sorted track limits from function call
%        plot(start_left_limits(1,1),start_left_limits(1,2),'color','blue','marker','o','linestyle','none','markersize',10);
%        hold on;
%        plot(start_right_limits(1,1),start_right_limits(1,2),'color',[1 1 0],'marker','o','linestyle','none','markersize',10);
%        hold on;
%        L_c=plot(limits_left_sort(:,1),limits_left_sort(:,2),'.','Color','blue','MarkerSize',17,'MarkerFaceColor','red');
%        hold on;
%        R_c=plot(limits_right_sort(:,1),limits_right_sort(:,2),'.','Color',[1 1 0],'MarkerSize',17,'MarkerFaceColor','red');
%        hold on;
%        ill_p = plot(interp_limits_left(:,1),interp_limits_left(:,2),'color','red','marker','.','linestyle','none','markersize',7);
%        hold on;
%        ilr_p = plot(interp_limits_right(:,1),interp_limits_right(:,2),'color','red','marker','.','linestyle','none','markersize',7);
%        hold on;

        % Pause to see sorted cones
        pause(0.1);
        
        end
    
end

