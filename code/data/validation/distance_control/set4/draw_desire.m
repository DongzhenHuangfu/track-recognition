function draw_desire(str,number)

close all

load([str '_desire.mat']);

left = left(1:number,:,:);
right = right(1:number,:,:);

save([str '_fordraw.mat'],'left','right', 'position')

show([str '_fordraw'],'-')

saveas(1,['pictures/' str '_desire.jpg'])

end