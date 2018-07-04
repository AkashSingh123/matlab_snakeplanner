function [target_point,target_point_buffer]=find_rantarget_point_norm(target_point_buffer,A,blackout_nodes,vx,vy)
post=1;
list_ranadj_nodes=get_ranadj_nodes_norm(A,target_point_buffer,vx,vy);

target_buf_len=size(target_point_buffer,1);
if(size(list_ranadj_nodes,1)==0)
    target_point=[0,0];
    target_point_buffer(target_buf_len+1,1:2) = target_point;
else
    
 target_point=list_ranadj_nodes(1,1:2);
 target_point_buffer(target_buf_len+1,1:2) = target_point;

 if(size(list_ranadj_nodes,1)==1)
     if(check_blackout(target_point_buffer,blackout_nodes))
         post=1;
   
     else
         post=0;
     end

 else   
 for i=1:size(list_ranadj_nodes,1)-1
   if(post==1)   
     if(check_blackout(target_point_buffer,blackout_nodes))
        target_point=list_ranadj_nodes(i+1,1:2);
        target_point_buffer(target_buf_len+1,1:2) = target_point;
     else
        target_point=list_ranadj_nodes(i,1:2);
        target_point_buffer(target_buf_len+1,1:2) = target_point; 
        post=0;

     end
   end
 end
 end


 if(check_blackout(target_point_buffer,blackout_nodes))

 else
    post=0;
 end

  if(post==1)
     target_point=[0,0];
  end
%disp(target_point_buffer);
end
end


  




