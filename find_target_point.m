function [target_point,target_point_buffer,blackout_nodes]=find_target_point(target_point_buffer,A,vx,vy,blackout_nodes,repeat_nodes_buffer)
%node_number=size(target_point_buffer,1)-1;
list_adj_nodes=get_adj_nodes(target_point_buffer,A,vx,vy);
% target_point=list_adj_nodes(2,1:2);
blackout_nodes=blackout(target_point_buffer,blackout_nodes);
    %disp(size(list_adj_nodes,1));
repeat_count=count_node_rep(repeat_nodes_buffer,target_point_buffer);
if((size(list_adj_nodes,1)==repeat_count+1)||(size(list_adj_nodes,1)==1))
        target_point=[0,0];
else   
    target_point = list_adj_nodes(repeat_count+2,1:2);
    target_point_buffer(end,1:2)=target_point;
end
    disp(target_point);
    
    
end