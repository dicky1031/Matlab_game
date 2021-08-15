 [x,y,dir,b]=ball; 
if b
    skill = scatter(x,y,100,'g','filled');
    for k = 1:3
    while dir(1)==0
        y = y + dir;
    end
    while dir(2)==0
        x = x + dir;
    end
    end
end
 
 
 %%
 skillfcn(obj,event)
       if ispress.space
        skill = scatter(ball.XData,ball.YData,100,'g','filled');
       end
       skill.XData = rand;
       skill.YData = rand;
