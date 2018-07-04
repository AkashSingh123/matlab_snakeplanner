function adj_nodes = get_ranadj_nodes(A,target_point_buffer,vx,vy)
r=0;
points = A;
post=1;
state_a=0;
state_b=0;
rem=0;
staterem_a=0;
staterem_b=0;
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
for check=1:size(points,1)
    if(round(points(check,1),2)==round(target_point_buffer(end-1,1),2)&& round(points(check,2),2)==round(target_point_buffer(end-1,2),2))
        req=check;
       
    end
end
 adj_nodes=adj_nodes_buffer{req};
 adj_nodes=get_sorted_adjnodes(adj_nodes,target_point_buffer);
 
for i=1:size(adj_nodes,1)
    if(round(adj_nodes(i,1:2),2)==round(target_point_buffer(end-2,1:2),2))
        rem=i;
    end
end

if(rem==1)
adj_nodes = adj_nodes((2:end),1:2);
staterem_a=1;
end
if(rem==size(adj_nodes,1) && staterem_a==0)
adj_nodes = adj_nodes((1:rem-1),1:2);
staterem_b=1;
end    
if(rem>1 && staterem_b==0)
adj_nodes = [adj_nodes((1:rem-1),1:2);adj_nodes((rem+1:end),1:2)];
end


for j=1:size(adj_nodes,1)
    if(post==1)
    if(round(adj_nodes(j,1:2),2)==round(target_point_buffer(end-5,1:2),2))
        r=j;
        post=0;
    end
    end

end


if(r==1)
adj_nodes = adj_nodes((2:end),1:2);
state_a=1;
end
if(r==size(adj_nodes,1) && state_a==0)
adj_nodes = adj_nodes((1:r-1),1:2);
state_b=1;
end    
if(r>1 && state_b==0)
adj_nodes = [adj_nodes((1:r-1),1:2);adj_nodes((r+1:end),1:2)];
end

end