function nodes = get_list_nodes(vx,vy)


% 
% x=rand(30,1)*30;
% y=rand(30,1)*30;
% % plot(x,y);
% 
% axis([0 30 0 30]);
% hold on;
% voronoi(x,y);
% [vx,vy]=voronoi(x,y);
% %scatter(vx(1,:),vy(1,:));
nodes=[vx(1,1),vy(1,1)];
present=0;
 for i=1:size(vx,2)
    for k=1:size(nodes,1)
        if(round(vx(1,i),2)==round(nodes(k,1),2)&& round(vy(1,i),2)==round(nodes(k,2),2))
            present=1;
        end
    end
    if(present==1)
        present=0;
    else
    nodes=[nodes;vx(1,i),vy(1,i)];
    end
end
% 
%     scatter(nodes(1:end,1),nodes(1:end,2));
    
end