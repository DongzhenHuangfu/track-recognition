function [left, right] = generate_badcones(dataname,breaking_position, continuous_bad_cones, mindistance, reposname)

figure()
show([reposname 'data1'], '')
saveas(1,[reposname 'pictures/'  'data1_input.jpg'])
show([reposname 'data1'], '-')
saveas(1,[reposname 'pictures/'  'data1_desir.jpg'])


close all;
load(dataname);

switch continuous_bad_cones
    case 0
        % no bad cones
        save([reposname 'data2.mat'], 'left', 'right', 'position')
        figure()
        show(dataname,'-')
        figure()
        show([reposname 'data2'],'-')
        saveas(1,[reposname 'pictures/'  'data2_desir_0.jpg'])
        saveas(1,[reposname 'pictures/'  'data2_desir_1.jpg'])
        saveas(1,[reposname 'pictures/'  'data2_desir_2.jpg'])
      
    case 1    
        % one bad cones
        if breaking_position(1) ~= 0
            for j = 1:size(breaking_position,2)
                for i = 0:(size(left,1)-breaking_position(j))
                    left(size(left,1)-i+1,:,:) = left(size(left,1)-i,:,:);
                    right(size(right,1)-i+1,:,:) = right(size(right,1)-i,:,:);
                end
                left(breaking_position(j)+1,1) = 0.5*(left(breaking_position(j),1)+left(breaking_position(j)+1,1)) - mindistance/4;
                right(breaking_position(j)+1,1) = 0.5*(right(breaking_position(j),1)+right(breaking_position(j)+1,1)) - mindistance/4;
                left(breaking_position(j)+1,2) = 0.5*(left(breaking_position(j),2)+left(breaking_position(j)+1,2)) - mindistance/4;
                right(breaking_position(j)+1,2) = 0.5*(right(breaking_position(j),2)+right(breaking_position(j)+1,2)) - mindistance/4;
                left(breaking_position(j)+1,3) = 500+j;
                right(breaking_position(j)+1,3) = 600+j;
            end
        end
        save([reposname 'data2.mat'], 'left', 'right', 'position')
        figure()
        show(dataname,'-')
        saveas(1,[reposname 'pictures/'  'data2_desir_0.jpg'])
        figure()
        show([reposname 'data2'], '-')
        saveas(2,[reposname 'pictures/'  'data2_desir_1.jpg'])
        saveas(2,[reposname 'pictures/'  'data2_desir_2.jpg'])

    case 2
        % two bad cones
        if breaking_position(1) ~= 0
            for j = 1:size(breaking_position,2)
                for i = 0:(size(left,1)-breaking_position(j))
                    left(size(left,1)-i+1,:,:) = left(size(left,1)-i,:,:);
                    right(size(right,1)-i+1,:,:) = right(size(right,1)-i,:,:);
                end
                if j ==1 || j==2
                    left(breaking_position(j)+1,1) = ((3-j)*left(breaking_position(j),1)+left(breaking_position(j)+1,1))/(4-j) - mindistance/4;
                    right(breaking_position(j)+1,1) = ((3-j)*right(breaking_position(j),1)+right(breaking_position(j)+1,1))/(4-j) - mindistance/4;
                    left(breaking_position(j)+1,2) = ((3-j)*left(breaking_position(j),2)+left(breaking_position(j)+1,2))/(4-j) - mindistance/4;
                    right(breaking_position(j)+1,2) = ((3-j)*right(breaking_position(j),2)+right(breaking_position(j)+1,2))/(4-j) - mindistance/4;
                    left(breaking_position(j)+1,3) = 500+j;
                    right(breaking_position(j)+1,3) = 600+j;            
                else
                    left(breaking_position(j)+1,1) = 0.5*(left(breaking_position(j),1)+left(breaking_position(j)+1,1)) - mindistance/4;
                    right(breaking_position(j)+1,1) = 0.5*(right(breaking_position(j),1)+right(breaking_position(j)+1,1)) - mindistance/4;
                    left(breaking_position(j)+1,2) = 0.5*(left(breaking_position(j),2)+left(breaking_position(j)+1,2)) - mindistance/4;
                    right(breaking_position(j)+1,2) = 0.5*(right(breaking_position(j),2)+right(breaking_position(j)+1,2)) - mindistance/4;
                    left(breaking_position(j)+1,3) = 500+j;
                    right(breaking_position(j)+1,3) = 600+j;
                end
            end
        end
        save([reposname 'data2.mat'], 'left', 'right', 'position')
        figure()
        show(dataname,'-')
        saveas(1,[reposname 'pictures/'  'data2_desir_0.jpg'])
        saveas(1,[reposname 'pictures/'  'data2_desir_1.jpg'])
        figure()
        show([reposname 'data2'], '-')
        saveas(2,[reposname 'pictures/'  'data2_desir_2.jpg'])
    
    case 3    
        % three bad cones
        if breaking_position(1) ~= 0
            for j = 1:size(breaking_position,2)
                for i = 0:(size(left,1)-breaking_position(j))
                    left(size(left,1)-i+1,:,:) = left(size(left,1)-i,:,:);
                    right(size(right,1)-i+1,:,:) = right(size(right,1)-i,:,:);
                end
                if j ==1 || j==2  || j==3
                    left(breaking_position(j)+1,1) = ((4-j)*left(breaking_position(j),1)+left(breaking_position(j)+1,1))/(5-j) - mindistance/4;
                    right(breaking_position(j)+1,1) = ((4-j)*right(breaking_position(j),1)+right(breaking_position(j)+1,1))/(5-j) - mindistance/4;
                    left(breaking_position(j)+1,2) = ((4-j)*left(breaking_position(j),2)+left(breaking_position(j)+1,2))/(5-j) - mindistance/4;
                    right(breaking_position(j)+1,2) = ((4-j)*right(breaking_position(j),2)+right(breaking_position(j)+1,2))/(5-j) - mindistance/4;
                    left(breaking_position(j)+1,3) = 500+j;
                    right(breaking_position(j)+1,3) = 600+j;            
                else
                    left(breaking_position(j)+1,1) = 0.5*(left(breaking_position(j),1)+left(breaking_position(j)+1,1)) - mindistance/4;
                    right(breaking_position(j)+1,1) = 0.5*(right(breaking_position(j),1)+right(breaking_position(j)+1,1)) - mindistance/4;
                    left(breaking_position(j)+1,2) = 0.5*(left(breaking_position(j),2)+left(breaking_position(j)+1,2)) - mindistance/4;
                    right(breaking_position(j)+1,2) = 0.5*(right(breaking_position(j),2)+right(breaking_position(j)+1,2)) - mindistance/4;
                    left(breaking_position(j)+1,3) = 500+j;
                    right(breaking_position(j)+1,3) = 600+j;
                end
            end
        end
        save([reposname 'data2.mat'], 'left', 'right', 'position')
        figure()
        show(dataname,'-')
        saveas(1,[reposname 'pictures/'  'data2_desir_0.jpg'])
        saveas(1,[reposname 'pictures/'  'data2_desir_1.jpg'])
        saveas(1,[reposname 'pictures/'  'data2_desir_2.jpg'])
        figure()
        show([reposname 'data2'],'-')     
end

figure()
show([reposname 'data2'],'')
saveas(1,[reposname 'pictures/'  'data2_input.jpg'])

end
