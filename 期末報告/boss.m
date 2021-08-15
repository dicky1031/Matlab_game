function boss()

boss = scatter(2,1,200,'b','p');
axis([0 3 0 3])
ispress = struct('uparrow',false,'downarrow',false,'rightarrow',false,'leftarrow',false);

  function bossfcn(obj,event)
      boss.XData = boss.XData + rand;
      boss.YData = boss.YData + rand;
  end
end

