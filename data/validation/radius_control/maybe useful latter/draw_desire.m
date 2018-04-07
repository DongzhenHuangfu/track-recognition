function draw_desire(dataname, reposname, breaking_position, continuous_bad_cones)

for i = 1:size(breaking_position,2)
    
    close all;
    load(dataname);
    left = left(breaking_position(i),:,:);
    right = right(breaking_position(i),:,:);
    save([reposname num2str(i) '.mat'],'left','right','position');
    figure()
    
end

    function [left, right] = change(namelast_desire, namelast, namethis)
        
        load(namelast_desire)
        left1 = left;
        right1 = right;
        load(namelast);
        nl = size(left,1);
        nr = size(right,1);
        load(namethis);
        left(1:nl,:,:) = left1;
        right(1:nr,:,:) = right1;
        
    end

end