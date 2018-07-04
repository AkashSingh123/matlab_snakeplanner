function list_adj_nodes = check_unvisited_nodes(node_number,A)
j=0;
for i=1:36
    a=pdist(A(node_number),A(i));
    if((norm(a)==norm(vx(1,1)-vx(1,2)))||(norm(a)==norm(vy(1,1)-vy(2,1))))
        list_adj_nodes=[adjacent_node;a];
        j=j+1;
    end
end
        
    
