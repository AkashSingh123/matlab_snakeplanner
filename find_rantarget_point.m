function [target_point,target_point_buffer,blackout_nodes]=find_rantarget_point(target_point_buffer,A,blackout_nodes,repeat_nodes_buffer,vx,vy)
%node_number=size(target_point_buffer,1)-1;

blackout_nodes=blackout(target_point_buffer,blackout_nodes);
list_ranadj_nodes=get_ranadj_nodes(A,target_point_buffer,vx,vy);
% target_point=list_adj_nodes(2,1:2);
    %disp(size(list_adj_nodes,1));
repeat_count=count_node_rep(repeat_nodes_buffer,target_point_buffer);
if((size(list_ranadj_nodes,1)==repeat_count+1)||(size(list_ranadj_nodes,1)==1))
        target_point=[0,0];
else   
    target_point = list_ranadj_nodes(repeat_count+2,1:2);
    target_point_buffer(end,1:2)=target_point;
end
    disp(target_point);
end