function ball()
fig = figure('KeyPressFcn',@kpfcn,'KeyReleaseFcn',@krfcn);
set (gca,'position',[0.1,0.3,0.6,0.6] );
ball = scatter(1,1,200,'r','filled');

hold on;

boss = scatter(2,1,300,'b','p');
bossposition = [boss.XData boss.YData];
axis([0 3 0 3])
ispress = struct('uparrow',false,'downarrow',false,'rightarrow',false,'leftarrow',false,'space',false);


game = timer('ExecutionMode','FixedRate','Period',0.1,'TimerFcn',@gamefcn);
game2 = timer('ExecutionMode','Fixedspacing','Period',3,'TimerFcn',@bossfcn);
start(game)
start(game2)

dir = [0 0];

game3 = timer('ExecutionMode','Fixedspacing','Period',0.1,'TimerFcn',@skill);
start(game3)












  function gamefcn(obj,event)
      ball.XData(ball.XData > 3 ) = ball.XData(ball.XData > 3) - 3;
      ball.XData(ball.XData < 0 ) = ball.XData(ball.XData < 0) + 3;
      ball.YData(ball.YData > 3 ) = ball.YData(ball.YData > 3) - 3;
      ball.YData(ball.YData < 0 ) = ball.YData(ball.YData < 0) + 3;
    if ispress.uparrow
      ball.YData = ball.YData + 0.1;
      dir = [0 0.1];
      value = 1;
    else
      value = 0;
    end
    if ispress.downarrow
      ball.YData = ball.YData - 0.1;
      dir = [0 -0.1];
    end
    if ispress.rightarrow
      ball.XData = ball.XData + 0.1;
      dir = [0.1 0];
    end
    if ispress.leftarrow
      ball.XData = ball.XData - 0.1;
      dir = [-0.1 0];
    end
    
   
    
  end

    function skill(obj,event)
        if ispress.space
           
            ski = scatter(ball.XData,ball.YData,100,'g','filled');
            for ii = 1:0.1:4
                if dir(1) == 0
                    ski.YData = ski.YData + dir(2);
                   
                    
                elseif dir (2) == 0
                    ski.XData = ski.XData + dir(1)
                   
                end
                 drawnow; 
                 
                 if abs(ski.XData-boss.XData)<0.1 && abs(ski.YData-boss.YData)<0.1 
                        delete(boss);
                        [y, fs]=audioread('小朋友下樓梯音效.mp3'); % 讀取音訊檔
                        sound(y, fs); % 播放音訊
                 end 
            end
           
            %skiposition = [ski.XData ski.YData];
        end
    end



  function krfcn(obj,event)
    ispress.(event.Key) = false;
  end
 
  function kpfcn(obj,event)
    ispress.(event.Key) = true;
  end
  function bossfcn(obj,event)
      
   boss.XData = rand+rand+rand;
   boss.YData = rand+rand+rand;
  
  end
  end