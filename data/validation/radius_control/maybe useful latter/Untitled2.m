    %draw_desire(dataname, reposname, breaking_position, continuous_bad_cones)
    switch continuous_bad_cones
        
        case 0 
            
            figure()
            show(newname,'-')
            saveas(2,[responame 'pictures/' newname '_desire_0.jpg'])
            saveas(2,[responame 'pictures/' newname '_desire_1.jpg'])
            saveas(2,[responame 'pictures/' newname '_desire_2.jpg'])
            
        case 1
            
            index = 0;
            for j = 1:size(breaking_position)
                
                if seperate_numbers(i) > breaking_position(j)
                    
                    index = breaking_position -j;
                    
                else
                    
                    break
                    
                end
                
            end
            
              
            load([name '_origin.mat'])
            left = left(1:index,:,:);
            right = right(1:index,:,:);
            save([responame name '_fordraw.mat'])
            figure()
            
            
    
        case 2
            
            
            
        case 3