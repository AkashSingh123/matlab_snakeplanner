function target_point=calculate_target_point(neck,path)
path=path';
neck=neck(1:2);
% path=path(path(:,2)>neck(2)+ 4,:);
neck=neck';
distance_matrix = pdist2(neck,path);
min_dist_matrix = sortrows(distance_matrix');
index=find(distance_matrix==min_dist_matrix(1));
target_point = path(index+8,:);
scatter(target_point(1),target_point(2));
path=path';
plot(path(1,:),path(2,:));
end

% function target_point = calculate_target_point(neck,path)
% path=path';
% neck=neck(1:2);
% neck=neck';
% 
% t = linspace(-pi/9,pi-pi/10);plot((cos(t)*0.08+neck(1)),(sin(t)*0.08+neck(2)));
% circle_cood=[(cos(t)*0.08+neck(1))',(sin(t)*0.08+neck(2))'];
% dist_matrix=pdist2(circle_cood,path);
% 
% [num idx]=min(dist_matrix(:));
% [x,y]=ind2sub(size(dist_matrix),idx);
% % disp((ind2sub(size(dist_matrix),idx)));
% % if(size(y)>1)
% %     y=y(size(y));
% % end
% target_point=path(y,:);
% 
% scatter(target_point(1),target_point(2));
% path=path';
% plot(path(1,:),path(2,:));
% %scatter(target_point(1),target_point(2));
% 
% end