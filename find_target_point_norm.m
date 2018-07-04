function [target_point,target_point_buffer]=find_target_point_norm(target_point_buffer,A,vx,vy,blackout_nodes)
list_adj_nodes=get_adj_nodes_norm(target_point_buffer,A,vx,vy);
target_point=list_adj_nodes(1,1:2);
   k=size(list_adj_nodes,1);
   target_point_buffer(end+1,1:2) = target_point;

if((size(list_adj_nodes,1)==1)&&(check_blackout(target_point_buffer,blackout_nodes)||all(round(target_point_buffer(end,1:2))==round(target_point_buffer(end-4,1:2)))))
    
    target_point=[0,0];
    
else

   if(check_blackout(target_point_buffer,blackout_nodes)||all(round(target_point_buffer(end,1:2))==round(target_point_buffer(end-4,1:2))))
      target_point=list_adj_nodes(2,1:2);
      target_point_buffer(end,1:2) = target_point;
   end

   if(k==3)
   if(check_blackout(target_point_buffer,blackout_nodes)||all(round(target_point_buffer(end,1:2))==round(target_point_buffer(end-4,1:2))))
   
     target_point=list_adj_nodes(3,1:2);
     target_point_buffer(end,1:2) = target_point;
    
   end
   end
   if(check_blackout(target_point_buffer,blackout_nodes)||all(round(target_point_buffer(end,1:2))==round(target_point_buffer(end-4,1:2))))
    
     target_point=[0,0];
   end
   
   
   
end
%disp(target_point_buffer);
end

