function boolean=check_blackout(target_point_buffer,blackout_nodes)
boolean=0;
 for check=0:size(blackout_nodes,1)/5-1
     if(round(blackout_nodes(5*check+1:5*check+5,1:2))==round(target_point_buffer(end-4:end,1:2)))
         boolean=1;
     end
         
 end