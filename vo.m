


points = get_list_nodes(vx,vy);

for k=1:size(points,1)
  list_adj_nodes=[];
  p=[points(k,1),points(k,2)];
 
        for j=1:2
             for i=1:size(vx,2)
                if(round(p(1),2)==round(vx(j,i),2) && round(p(2),2)==round(vy(j,i),2))
                    if(j==1)
                    list_adj_nodes=[list_adj_nodes;vx(2,i),vy(2,i)];
                    else
                    list_adj_nodes=[list_adj_nodes;vx(1,i),vy(1,i)];
                    end
                end
             end
       end
        
        adj_nodes_buffer{k}=list_adj_nodes;

end