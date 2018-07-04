function A=indexing_voronoi_nodes(vx,vy)
k=1;
for i=1:2
for j=13:-1:1
    A(k,1:2)=[vx(i,j),vy(i,j)];
    k=k+1;
end
end
k=27;
% for j=124:-1:110
%     A(k,1:2)=[vx(1,j),vy(1,j)];
%     k=k+1;
% end
% end
for j=115:-1:103
    A(k,1:2)=[vx(1,j),vy(1,j)];
    k=k+1;
end
end