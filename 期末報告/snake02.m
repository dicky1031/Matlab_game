function snake02
% figure & axes
  L = 20;                             %���a�j�p
  axis equal                          %���жb����
  axis(0.5+[0 L 0 L])                 %���жb���
  hold on                             %�T�w���жb
  % snake
  sz = 300;                           %�D�Y�j�p
  pos = [5 5];                        %�D�Y��m
  dir = [1 0];                        %�D�Y��V
  body = [];                          %�D����m�x�}
  long = 5;                           %�D������
  hs = scatter(gca,pos(1),pos(2),...  %ø�s�D�Y
               sz,'bs','filled');
  L = 20;                             %�C����ɪ�
  axis equal                          %�T�w���жb
  axis(0.5+[0 L 0 L])                 %�]�w���жb
  hold on                             %�T�wø�Ϯy��
 
  apos = [10 10];                      %������l��m
  ha = scatter(gca,apos(1),apos(2),... %�����Ϫ���
    sz,'rs','filled');                 
 
  set(gcf,'KeyPressFcn',@kpfcn)        %�]�wfigure�������ݩ�(Control Properties)
 
  fps = 1;                                     %�e����s�v(frame per sencond)
  game = timer('ExecutionMode','FixedRate',... %�C���e����s�p�ɾ�
    'Period',1/fps,'TimerFcn',@gamefcn);
  start(game)                                  %�p�ɾ��}�l
 
  function gamefcn(~,~)                    %�C���e���w�ɧ�s�禡
    pos = pos + dir;                       %�۰ʫe�i
 
    pos(pos > L) = pos(pos > L) - L;       %�g�������
    pos(pos < 1) = pos(pos < 1) - long               %�����D��
      body(end,:) = [];
                                      
 
    if intersect(body(2:end,:),pos,'rows') %��D����m�]�t�D�Y��m
      long = 5;                            %�C������(�N�D�������٭�ܪ�l����)
    end                                   
 
    if isequal(pos(1,:),apos)              %�Y�쭹��
      long = long + 1;                     %�D������+1
      apos = randi(L,[1 2]);               %�H����m���ͷs����
    end                                   
 
    set(ha,'XData',apos(1),...             %��s�����Ϫ���
      'YData',apos(2))
    set(hs,'XData',body(:,1),...           %��s�D�Ϫ���
      'YData',body(:,2));
  end
 
  function kpfcn(~,event)        %KeyPressFcn���^���禡(Callback Function)
    switch event.Key             %�̾ڤ�V����ܤ�V
      case 'uparrow'
        dirtmp = [0 1];
      case 'downarrow'
        dirtmp = [0 -1];
      case 'leftarrow'
        dirtmp = [-1 0];
      case 'rightarrow'
        dirtmp = [1 0];
      otherwise
        dirtmp = nan;
    end
    if any(dir + dirtmp)         %���i�f�V
      dir = dirtmp;
    end
  end
  end
  