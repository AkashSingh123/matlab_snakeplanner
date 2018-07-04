function list_adj_nodes = get_adj_nodes(target_point_buffer,A,vx,vy)
post=1;
list_adj_nodes=[];
r=0;
for i=1:39
    a=pdist2(target_point_buffer(end-1,1:2),A(i,1:2));
    a=round(a);
    if(a==round(norm(vx(1,1)-vx(1,2)))||(a==round(norm(vy(2,1)-vy(1,1)))))
      list_adj_nodes=[list_adj_nodes;A(i,1:2)]; 
    end
end

for i=1:size(list_adj_nodes,1)
    if(round(list_adj_nodes(i,1:2))==round(target_point_buffer(end-2,1:2)))
        rem=i;
    end
end

list_adj_nodes = [list_adj_nodes((1:rem-1),1:2);list_adj_nodes((rem+1:end),1:2)];

for j=1:size(list_adj_nodes,1)
    if(post==1)
    if(round(list_adj_nodes(j,1:2))==round(target_point_buffer(end-4,1:2)))
        r=j;
        post=0;
    end
    end

end

if(r>1)
list_adj_nodes = [list_adj_nodes((1:r-1),1:2);list_adj_nodes((r+1:end),1:2)];
elseif(r==1)
list_adj_nodes = [list_adj_nodes((2:end),1:2)];
end
end