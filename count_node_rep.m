function count = count_node_rep(repeat_nodes_buffer,target_point_buffer)
count=0;
for i=1:size(repeat_nodes_buffer,2)/2
if(round(target_point_buffer(end-5:end-1,1:2))==round(repeat_nodes_buffer(1:5,2*i-1:2*i)))
count=count+1;
end
end
end