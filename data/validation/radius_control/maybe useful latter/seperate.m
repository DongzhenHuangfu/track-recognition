function seperate(name, seperate_numbers, responame)

figure()
show([responame 'data1'],'')
saveas(1,[responame 'pictures/data1_input.jpg'])

for i = 1:size(seperate_numbers,2)
    
    load([name '.mat'])
    left = left(1:seperate_numbers(i),:,:);
    right = right(1:seperate_numbers(i),:,:);
    newname = ['data' num2str(i+1)];
    save([responame newname '.mat'], 'left', 'right', 'position')
    
    figure()
    show([responame newname],'')
    saveas(i+1,[responame '/pictures/' newname '_input.jpg'])
        
    end
    
end
