function snake
  axis equal                    %設置座標軸?對稱      
  axis(0.5+[0, 20, 0, 20])          %加0.5是?了之後的牆壁碰撞檢測的方便
  set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')      %隱藏座標軸
  set(gca, 'color', 'y')
  hold on                                                  
  snakeTop = [5, 5];                   %這是蛇頭的初始位置
  snakeDirect = [1, 0];                %蛇的方向
  body = [5, 5 ; 4, 5 ; 3, 5];          %蛇身的初始位置數組  
  long = 3;                                 %蛇的長度            
  food = [10, 10];                        %食物的初始位置
  plotSnake = scatter(gca, body(:, 1), body(:, 2), 220, 'bs', 'filled');                  %通過函數scatter畫出蛇身，scatter是畫散點圖的函數
  plotFood = scatter(gca, food(1), food(2), 150, 'g', 'filled');                           %通過函數scatter畫出食物
  set(gcf, 'KeyPressFcn', @key)                                                                     %設置按鍵判斷
  fps = 5;                                    
  game = timer('ExecutionMode', 'FixedRate', 'Period',1/fps, 'TimerFcn', @snakeGame);       %設置定時器的參數
  start(game)                               %開始遊戲
 
   function snakeGame(~,~)
    snakeTop = snakeTop + snakeDirect;              %蛇的移動
    body = [snakeTop; body] ;                                 
    while length(body)> long
      body(end, : ) = [];         
      
    end
    if intersect(body(2 : end, : ), snakeTop, 'rows')               %判斷蛇頭是否撞到自己的身體
        ButtonName1 = questdlg('遊戲結束，請點擊按鈕繼續......','Gave Over','重新開始','關閉遊戲', 'Yes');
        if ButtonName1 == '重新開始'
            clf;
            snake();
        else
            close;
        end
    end      
    
    if isequal(snakeTop, food)             %判斷是否吃到食物
      long = long + 1;                   
      food = randi(20, [1, 2]); 
      while any(ismember(body, food, 'rows'))
          food = randi(20, [1, 2]);
      end
    end        
    
    if (snakeTop(1, 1)>20)||(snakeTop(1, 1)<1)||(snakeTop(1, 2)>20)||(snakeTop(1, 2)<1)         %判斷是否撞到牆壁
        ButtonName2 = questdlg('遊戲結束，請點擊按鈕繼續......','Gave Over','重新開始','關閉遊戲', '關閉遊戲');
        if ButtonName2 == '重新開始'
            clf;
            snake();
        else
            close;
        end
    end
    
    set(plotFood, 'XData', food(1),  'YData', food(2));             %不斷的刷新畫面
    set(plotSnake, 'XData', body( : , 1), 'YData', body( : , 2));
  end
 
  function key(~,event)       
    switch event.Key            
      case 'uparrow'
        direct = [0, 1];
      case 'downarrow'
        direct = [0, -1];
      case 'leftarrow'
        direct = [-1, 0];
      case 'rightarrow'
        direct = [1, 0];
      case 'space'
        stop(game); 
        direct = snakeDirect;
        ButtonName3 = questdlg('遊戲暫停......', 'Stop ', '重新開始', '關閉遊戲', '繼續遊戲', '關閉遊戲');
        if ButtonName3 == '重新開始'
            clf;
            snake();
        elseif ButtonName3 == '關閉遊戲'
            close;
        else
           start(game);
        end   
      otherwise
        direct = nan;
    end
    if any(snakeDirect + direct)   
      snakeDirect = direct;
    end
  end
end