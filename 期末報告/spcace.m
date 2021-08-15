function b = spcace()
ispress = struct('uparrow',false,'downarrow',false,'rightarrow',false,'leftarrow',false,'space',false);
function gamefcn(obj,event)
    if ispress.space
        b = true;
    end
    
  end
 


  function krfcn(obj,event)
    ispress.(event.Key) = false;
  end
 
  function kpfcn(obj,event)
    ispress.(event.Key) = true;
  end
end