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
recording =0;
%%
if recording
    writerObj = VideoWriter('curvepath4_varparameters');
    open(writerObj);
end

%%
omega_s=2*pi/8;
N=9;%number of modules
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
q_h=[8;-18;pi/2];
g_h=[cos(q_h(3)),-sin(q_h(3)),q_h(1);sin(q_h(3)),cos(q_h(3)),q_h(2);0,0,1];
[h, com]=drawActiveSnake(q_h(1),q_h(2),q_h(3),angle,2,activation);
F=[eye(2),[L;0];0 0 1];
peg_spacing=8;
[peg_X,peg_Y] = meshgrid(x_min:peg_spacing:7.0948,y_min:peg_spacing:y_max);
pegs_lineX = linspace(10.0948,100,14);
pegs_lineY = -12*ones(1,14);
pegs_lineX2 = linspace(10.0948,100,14);
pegs_lineY2 = -23*ones(1,14);
pegs_lineX3 = linspace(10.0948,100,14);
pegs_lineY3 = -32*ones(1,14);
pegs_lineX4 = linspace(10.0848,100,14);
pegs_lineY4 = -1*ones(1,14);

peg_X = [peg_X(:);pegs_lineX';pegs_lineX2';pegs_lineX3';pegs_lineX4'];
peg_Y = [peg_Y(:);pegs_lineY';pegs_lineY2';pegs_lineY3';pegs_lineY4'];
Peg_req_X=[pegs_lineX';pegs_lineX2';pegs_lineX3';pegs_lineX4'];
Peg_req_Y=[pegs_lineY';pegs_lineY2';pegs_lineY3';pegs_lineY4'];
scatter(peg_X,peg_Y,10,'r','fill');
plot(peg_X,peg_Y,'.');
voronoi(Peg_req_X,Peg_req_Y);
[vx,vy]=voronoi(Peg_req_X,Peg_req_Y);

%scatter(vx(1,:),vy(1,:));

%%
%visualization
com_path=com;%record center of mass trajecotryabs(ceil((angle(1)-find_nex_headang(g_h,m,n,g,L))
h_com=plot(com_path(1,:),com_path(2,:),'b','linewidth',3);
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

title('curve pathslope.1/3');
xlabel('X','fontsize',15);
ylabel('Y','fontsize',15);
K=diag([1;4;1]);%friction profilen
activation=ones(1,N);

%% path1
m = vx(1,1)*ones(1,23);
n = linspace(vy(1,1),100,23);%n=-5*sin(m/3+3.204)-4.204;
%% path2
o=linspace(vx(2,1),vx(2,2),23);
p=vy(2,1)*ones(1,23);
%% path3
q = (vx(2,2)+0.1)*ones(1,23);
r = linspace(vy(2,2),vy(1,2),23);
%% path4
s= linspace(vx(1,2),vx(1,3),23);
z= vy(1,2)*ones(1,23);
%% path5
w=linspace(vx(1,3)+0.1,100,100);
x= vy(1,2)*ones(1,100);

%% start path
u=linspace(q_h(1),100,100);
v=vy(1,1)*ones(1,100);
%% incremental path
backtrack=0;
li=0;
entry=1;
dead=3;
tip=g_h*inv(F);
%% combination_paths
 n=[v];%,n,p,r,z,x];
 m=[u];%,m,o,q,s,w];
plot(m,n);
%% Parameters for Tuning
buffer_length=20;
angle_sector=12;
%% 
com3 = com;
angle_buffer=Am*sin(omega_s*(1:1/buffer_length:N-1));
buffer=Init_Buffer(angle_buffer',buffer_length,N);
counter=0;
%%
while t<2*pi*50
    t = t+dt;
    post=1;
    g=framesInHead(angle,L);
    next_headang = linspace(angle(1),find_nex_headang(g_h,m,n,g,L),150);
    
     
    [buffer,angle2]=find_angles(buffer,t,next_headang(angle_sector),N);
    diff_angles = (angle2-angle)/dt;
    
    
   
    %% redrawing the path to be taken 
    
        li=li+1;
        start_angle(:,li) = angle2;
        g_h_rstart{li} = g_h;
        buffer_rstart(li) = buffer;
        diff_angle_rstart(:,li) = diff_angles;
        g_rstart{li}=g;
        conf_rstart(li)=conf;
     

       if(backtrack==1)
          vertic_cov=vx(1,1:12)<g_h_rstart{size(g_h_rstart,2)}(1,3);
          max_a = find_maxpositive(vertic_cov);
          for sur = 1:size(g_h_rstart,2)
           if(post==1)
             if(g_h_rstart{sur}(1,3)>vx(1,max_a-2))
                ni=sur;
                post=0;
             end
           end
          end
          angle2 = start_angle(:,ni);
          g_h = g_h_rstart{ni};
          buffer = buffer_rstart(ni);
          diff_angles = diff_angle_rstart(:,ni);
          [m,n]=updated_path(m,n,g_h,turn_point,vx,vy);
          conf=conf_rstart(ni);
          g=g_rstart{ni};
          backtrack=0;
       end
    %disp(diff_angles);
    %% core
    if recording
        frame = getframe(gcf);
        writeVideo(writerObj,frame);
    end
    %conf=forwardSim(conf, alpha(joint_index, conf.t), alpha(joint_index, conf.t+dt), d_alpha(joint_index, conf.t), activation, dt, L,  K ,g_h,peg_spacing);
    conf=forwardSim(conf, angle2-diff_angles*dt, angle2, diff_angles, activation, dt, L,  K ,g_h,peg_spacing);
    %%
    %compute vc in head
    %vc_in_head=vcInHead(alpha(joint_index, conf.t), L);
    vc_in_head=vcInHead(angle2, L);
    g_h=conf.g/vc_in_head;%move the head
    q_h=[g_h(1,3);g_h(2,3);atan2(g_h(2,1),g_h(1,1))];
    neck=g_h*F;
    tip1=g_h*inv(F);
    fi=fi+1;
    if rem(fi,1)==0
        %redraw the snake
        for i=1:N
            delete(h{i});
        end
       
        %draw at discrete frames
        [h,com]=drawActiveFrameSnake(g_h,angle2,L,activation);
        com_path=[com_path,com];%#ok
        p_com=drawCOM(com,p_com);
        set(h_com,'xdata',com_path(1,:),'ydata',com_path(2,:));
        f_num=f_num+1;
        %         print(gcf,['record/',num2str(f_num,'%03d'),'.png'],'-dpng');
        pause(0.5*dt);
    else
       
       
       
    end
        com2=com;
        Distance_travelled_percycle = norm(tip1-tip);
        
        % scatter(t,norm(Distance_travelled_percycle),50,'fill','r');
       % disp(norm(Distance_travelled_percycle));
        a=Distance_travelled_percycle*2*pi/dt ;
        disp(a);
        %% 
        if(a<dead && entry>1)
           turn_point1=fin_turnpoint(vx,vy,g_h);
           turn_point=[turn_point1(1)-norm(vx(1,1)-vx(1,2)),turn_point1(2)];
           backtrack=1;
           entry=-1;
           %dead=0.08;
        end
        %disp(com2(1)-com3(1));
        com3=com2;
        entry=entry+1;
        
        %% 
        tip=tip1;
        angle = angle2;
end
if recording
    close(writerObj);
end
% end