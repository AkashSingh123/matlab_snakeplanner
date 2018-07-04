function adj_nodes_retfinal=get_sorted_adjnodes_norm(adj_nodes,target_point_buffer)
 adj_nodes_ret=adj_nodes(1,1:2);
 r=0;
 rr=0;
 rem=0;
 target_buf_len=size(target_point_buffer,1);
 for i=1:size(adj_nodes,1)
     present=0;
     
     for k=1:size(adj_nodes_ret,1)
         if(round(adj_nodes(i,1:2),2)==round(adj_nodes_ret(k,1:2),2))
             present=1;
         end
     end
     if(present==1)
         present=0;
     else
         adj_nodes_ret=[adj_nodes_ret;adj_nodes(i,1:2)];
         
     end
 end
 
 
for i=1:size(adj_nodes_ret,1)
    if(round(adj_nodes_ret(i,1:2),2)==round(target_point_buffer( target_buf_len,1:2),2))
        rem=i;       
    end
end
if(rem==1)
     adj_nodes_ret = [adj_nodes_ret((2:end),1:2)];
     r=1;
end
if(rem==size(adj_nodes_ret,1) && r==0)
    adj_nodes_ret = adj_nodes_ret((1:end-1),1:2);
    rr=1;
end
if(rem>1 && rr==0)
    adj_nodes_ret=[adj_nodes_ret((1:rem-1),1:2);adj_nodes_ret((rem+1:end),1:2)];
end



adj_nodes_retfinal =[];
 for i=1:size(adj_nodes_ret,1)
     present=0;
     
     
     if(norm(round(adj_nodes_ret(i,1),2))<50 && norm(round(adj_nodes_ret(i,2),2))<30)  
       present=1;
     end
   
     if(present==1)
       adj_nodes_retfinal=[adj_nodes_retfinal;adj_nodes_ret(i,1:2)];
     end
 end
end