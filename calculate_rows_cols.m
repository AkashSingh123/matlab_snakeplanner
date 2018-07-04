function [a,b]=calculate_rows_cols(goal_point,vx,vy)
post=1;
for j=1:13
    for i=1:4
    if(post==1)
        if(goal_point(1)==vx(i,j))
            b=i;
            post=0;
        end
    end
    end
end
post=1;
for j=1:13
    for i=1:4
    if(post==1)
        if(goal_point(2)==vy(i,j))
            a=j;
            post=0;
        end
    end
    end
end
end