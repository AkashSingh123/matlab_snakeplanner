%geometric_sim
%geometric_sim
close all
clear
addpath arrow3d/;
x_min = -60;
x_max =120;
y_min = -50;
y_max = 50;
t_min=0;
t_max=2*22*pi;
d_min=0;
d_max=61;
com3=0;
com2=0;
figure();hold on;axis equal;set(gcf,'color','w');
axis([x_min x_max y_min y_max]);
recording =1;
%%
if recording
    writerObj = VideoWriter('plan_tested1');
    open(writerObj);
end

%%
omega_s=2*pi/8;
N=8;%number of modules
L=2;
Am=1.2;
set(gca,'xtick',x_min:20:80,'ytick',y_min:20:y_max);


angle=Am*sin(omega_s*(1:N-1)');


alpha=@(t) Am*sin(t);

conf_list=[];%configuration list; storing all the nodes
%start simulation part
activation=zeros(1,N);

T=100;%number of time steps
dt=2*pi/T;

joint_index=(1:N-1)';%joint index
q_h=[8;-19;pi/2];
g_h=[cos(q_h(3)),-sin(q_h(3)),q_h(1);sin(q_h(3)),cos(q_h(3)),q_h(2);0,0,1];
[h, com]=drawActiveSnake(q_h(1),q_h(2),q_h(3),angle,2,activation);
F=[eye(2),[L;0];0 0 1];
peg_spacing=8;
[peg_X,peg_Y] = meshgrid(x_min:peg_spacing:3,y_min:peg_spacing:y_max);
% pegs_lineX = linspace(3.9822,100,14);
% pegs_lineY = -8.7326*ones(1,14);
% pegs_lineX2 = linspace(3.9822,100,16);
% pegs_lineY2 = -19.5046*ones(1,16);
% pegs_lineX3 = linspace(3.9822,100,10);
% pegs_lineY3 = -25.8906*ones(1,10);
% pegs_lineX4 = linspace(3.9822,100,12);
% pegs_lineY4 = -14.1186*ones(1,12);
% pegs_lineX = linspace(3.9822,100,14);
% pegs_lineY = -3.7326*ones(1,14);
% pegs_lineX2 = linspace(3.9822,100,14);
% pegs_lineY2 = t*ones(1,14);
% pegs_lineX3 = linspace(3.9822,100,14);
% pegs_lineY3 = -25.8906*ones(1,14);
% pegs_lineX4 = linspace(3.9822,100,14);
% pegs_lineY4 = -11.1186*ones(1,14);% a_ran = 3.9822;
% b_ran = 100;
% r1 = (b_ran-a_ran).*rand(24,1) + a_ran;
% c_ran= -3.7326;
% d_ran= -25.8906;
% r2= (c_ran-d_ran).*rand(24,1) + d_ran;
pegs_lineX=3.9822+(7.3860/10)*[0,0,0,0,10,10,10,18.5,18.5,18.5,18.5,28.5,28.5,31,31,39,39,39,39,49,49,49,49,59,59,59,59];
pegs_lineY=-25.8906+(7.3860/10)*[0,10,20,30,0,10,20,0,8,18,28,10,21,0,30,0,10,15,26,0,10,20,26,0,10,20,26];
% r1 = [pegs_lineX';pegs_lineX2';pegs_lineX3';pegs_lineX4'];
% r2 = [pegs_lineY';pegs_lineY2';pegs_lineY3';pegs_lineY4'];
 r1 = [pegs_lineX'];
 r2 = [pegs_lineY'];

peg_X = [peg_X(:);r1];
peg_Y = [peg_Y(:);r2];
Peg_req_X=[pegs_lineX';r1];
Peg_req_Y=[pegs_lineY';r2];
scatter(peg_X,peg_Y,10,'r','fill');
plot(peg_X,peg_Y,'.');
voronoi(r1,r2);
[vx,vy]=voronoi(r1,r2);

%scatter(vx(1,:),vy(1,:));

%%
%visualization
com_path=com;%record center of mass trajecotryabs(ceil((angle(1)-find_nex_headang(g_h,m,n,g,L))
h_com=plot(com_path(1,:),com_path(2,:),'b','linewidth',3);
com3=com;
a=10;
%%
l=0;
t=0;
fi=0;
f_num=0;

p_com=[];
%initilize conf
conf.t=0;%set up time
conf.g=g_h*vcInHead(angle,L);%vc position
conf.contacts=[];%contacts: empty at the very beginning
conf.contact_cost=0;%no cost at the beginning
conf.heuristic_cost=heuristicCost(conf.g);%heuristic cost
conf.estimated_cost=conf.contact_cost+conf.heuristic_cost;

title('planning2');
xlabel('X','fontsize',15);
ylabel('Y','fontsize',15);
K=diag([1;4;1]);%friction profilen
activation=ones(1,N);



%% path2
o=linspace(vx(2,1),vx(2,2),23);
p=vy(2,1)*ones(1,23);

%% target_point_indexing
A=get_list_nodes(vx,vy);
target_point_buffer=init_target_buffer(A,g_h);
%% incremental path
cycle=0;
backtrack=0;
li=0;
diff_angles=zeros(9);
entry=0;
dead=5;
path_type=1;
bactrac_count=1;
target_point = [target_point_buffer(end-1,1:2)];
target_point_buffer = [0,0;0,0;0,0;0,0;0,0;0,0;target_point];
%repeat_count=0;
blackout_nodes=[0,0;0,0;0,0;0,0;target_point];
last_visited_points=[];
repeat_node_buffer=[];
back_dis=3.8;
li_buff=[];
%% path1
m = linspace(g_h(1,3),target_point(1,1),23);
n = linspace(g_h(2,3),target_point(1,2),23);%n=-5*sin(m/3+3.204)-4.204;

%% Parameters for Tuning
buffer_length=15;
angle_sector=42;
diff_ang_sector=42;
comp=8;
%%
com3 = com;
angle_buffer=Am*sin(omega_s*(1:1/buffer_length:N-1));
buffer=Init_Buffer(angle_buffer',buffer_length,N);
counter=0;
%%
while t<2*pi*70
    t = t+dt;
    post=1;
    g=framesInHead(angle,L);
    if(backtrack==2)
     else
    [status,total_angle]=find_nex_headang(g_h,m,n,g,L,comp);
    
    %disp(total_angle);
     if(status==1)
          backtrack=1;
     end
    next_headang = linspace(angle(1),total_angle,150);
    next_headang = next_headang-diff_angles(1)/diff_ang_sector;
    [buffer,angle2]=find_angles(buffer,next_headang(angle_sector),N);
    diff_angles = (angle2-angle)/dt;
    %scatter(target_point_buffer(end,1),target_point_buffer(end,2));
   
  
    %% redrawing the path to be taken
   
        li=li+1;
        start_angle(:,li) = angle2;
        g_h_rstart{li} = g_h;
        buffer_rstart(li) = buffer;
        diff_angle_rstart(:,li) = diff_angles;
        g_rstart{li}=g;
        conf_rstart(li)=conf;
    
    end
       if(backtrack==1)
        if(status==0)
          
                 ni=li_buff(end);
                 li=ni-1;
        else
            
                blackout_nodes=blackout(target_point_buffer,blackout_nodes);
                last_visited_points=[target_point_buffer(end-4:end,1:2)];
                repeat_node_buffer=[repeat_node_buffer,last_visited_points];
                target_point = target_point_buffer(end-1,1:2);
                target_point_buffer=target_point_buffer(1:end-1,1:2);
                ni=li_buff(end)-1;
                li=ni-1;
                li_buff=li_buff(1:end-1);                
        end
          angle2 = start_angle(:,ni);
          g_h = g_h_rstart{ni};
          buffer = buffer_rstart(ni);
          diff_angles = diff_angle_rstart(:,ni);
          [m,n]=updated_path(target_point_buffer);
          conf=conf_rstart(ni); 
          backtrack=0;
          g=g_rstart{ni};
         
      end
       
          
          
          if(backtrack==2)
                 ni=li_buff(end-1);
                 li=ni-1;
                 li_buff=li_buff(1:end-2);
          
          angle2 = start_angle(:,ni);
          g_h = g_h_rstart{ni};
          buffer = buffer_rstart(ni);
          diff_angles = diff_angle_rstart(:,ni);
          blackout_nodes=[blackout_nodes;target_point_buffer(end-5:end-1,1:2)];
          target_point_buffer=target_point_buffer(1:end-2,1:2);
          target_point=target_point_buffer(end,1:2);
          [m,n]=updated_path(target_point_buffer);
          conf=conf_rstart(ni); 
          g=g_rstart{ni};
          backtrack=0;
          end
        % disp(target_point_buffer);
   
     % scatter(target_point_buffer(end,1),target_point_buffer(end,2));
 %%   
 
    %disp(diff_angles);
    %% core
    if recording
        frame = getframe(gcf);
        writeVideo(writerObj,frame);
    end
    conf=forwardSim(conf, angle2-diff_angles*dt, angle2, diff_angles, activation, dt, L,  K ,g_h,peg_spacing,vx,vy,r1,r2);
    %%
    %compute vc in head
    %vc_in_head=vcInHead(alpha(joint_index, conf.t), L);
    vc_in_head=vcInHead(angle2, L);
    g_h=conf.g/vc_in_head;%move the head
    q_h=[g_h(1,3);g_h(2,3);atan2(g_h(2,1),g_h(1,1))];
    neck=g_h*F;
    head_pos=[g_h(1,3),g_h(2,3)];
    %disp(pdist2(head_pos,target_point));
    fi=fi+1;
    if rem(fi,1)==0
        %redraw the snake
        for i=1:N
            delete(h{i});
        end
      
        %draw at discrete frames
        [h,com]=drawActiveFrameSnake(g_h,angle2,L,activation);
        com_path=[com_path,com];%#ok
       % p_com=drawCOM(com,p_com);
       % set(h_com,'xdata',com_path(1,:),'ydata',com_path(2,:));
        f_num=f_num+1;
        pause(0.5*dt);
    else
      
      
      
    end
        com2=com;
        Distance_travelled_percycle = norm(com2-com3);
        disp(norm(Distance_travelled_percycle));
        a=Distance_travelled_percycle*2*pi/dt ;

        %%
        
        if(norm(a)<dead && entry>2)
            % disp(repeat_count);
            [target_point,target_point_buffer,blackout_nodes] = find_rantarget_point(target_point_buffer,A,blackout_nodes,repeat_node_buffer,vx,vy);
            %disp(target_point_buffer);
            if(target_point==[0,0])
            backtrack=2;
            last_visited_points=[target_point_buffer(end-6:end-2,1:2)];
            repeat_node_buffer=[repeat_node_buffer,last_visited_points];
            com=[0,0];
            else
            backtrack=1;
            com=[0,0];
            last_visited_points=[target_point_buffer(end-5:end-1,1:2)];
            repeat_node_buffer=[repeat_node_buffer,last_visited_points];
            end
            
           
            
              
       elseif(pdist2(head_pos,target_point)>0 && pdist2(head_pos,target_point)<back_dis)
           
           
           li_buff=[li_buff,li];
           [target_point,target_point_buffer]  = find_rantarget_point_norm(target_point_buffer,A,blackout_nodes,vx,vy);
           
           if(target_point==[0,0])
            backtrack=2;
            com=[0,0];
            last_visited_points=[target_point_buffer(end-6:end-2,1:2)];
            repeat_node_buffer=[repeat_node_buffer,last_visited_points];
           else
            [m,n]=updated_path(target_point_buffer);      
           end
        end
        com3=com2;
        entry=entry+1;
        
        %%
        angle = angle2;
end
if recording
    scatter(m,n);
    close(writerObj);
end

% end