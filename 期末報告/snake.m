function snake
  axis equal                    %�]�m�y�жb?���      
  axis(0.5+[0, 20, 0, 20])          %�[0.5�O?�F���᪺����I���˴�����K
  set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')      %���îy�жb
  set(gca, 'color', 'y')
  hold on                                                  
  snakeTop = [5, 5];                   %�o�O�D�Y����l��m
  snakeDirect = [1, 0];                %�D����V
  body = [5, 5 ; 4, 5 ; 3, 5];          %�D������l��m�Ʋ�  
  long = 3;                                 %�D������            
  food = [10, 10];                        %��������l��m
  plotSnake = scatter(gca, body(:, 1), body(:, 2), 220, 'bs', 'filled');                  %�q�L���scatter�e�X�D���Ascatter�O�e���I�Ϫ����
  plotFood = scatter(gca, food(1), food(2), 150, 'g', 'filled');                           %�q�L���scatter�e�X����
  set(gcf, 'KeyPressFcn', @key)                                                                     %�]�m����P�_
  fps = 5;                                    
  game = timer('ExecutionMode', 'FixedRate', 'Period',1/fps, 'TimerFcn', @snakeGame);       %�]�m�w�ɾ����Ѽ�
  start(game)                               %�}�l�C��
 
   function snakeGame(~,~)
    snakeTop = snakeTop + snakeDirect;              %�D������
    body = [snakeTop; body] ;                                 
    while length(body)> long
      body(end, : ) = [];         
      
    end
    if intersect(body(2 : end, : ), snakeTop, 'rows')               %�P�_�D�Y�O�_����ۤv������
        ButtonName1 = questdlg('�C�������A���I�����s�~��......','Gave Over','���s�}�l','�����C��', 'Yes');
        if ButtonName1 == '���s�}�l'
            clf;
            snake();
        else
            close;
        end
    end      
    
    if isequal(snakeTop, food)             %�P�_�O�_�Y�쭹��
      long = long + 1;                   
      food = randi(20, [1, 2]); 
      while any(ismember(body, food, 'rows'))
          food = randi(20, [1, 2]);
      end
    end        
    
    if (snakeTop(1, 1)>20)||(snakeTop(1, 1)<1)||(snakeTop(1, 2)>20)||(snakeTop(1, 2)<1)         %�P�_�O�_�������
        ButtonName2 = questdlg('�C�������A���I�����s�~��......','Gave Over','���s�}�l','�����C��', '�����C��');
        if ButtonName2 == '���s�}�l'
            clf;
            snake();
        else
            close;
        end
    end
    
    set(plotFood, 'XData', food(1),  'YData', food(2));             %���_����s�e��
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
        ButtonName3 = questdlg('�C���Ȱ�......', 'Stop ', '���s�}�l', '�����C��', '�~��C��', '�����C��');
        if ButtonName3 == '���s�}�l'
            clf;
            snake();
        elseif ButtonName3 == '�����C��'
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