%geometric_sim
close all
clear
addpath arrow3d/;
x_min = -60;
x_max =150;
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
    writerObj = VideoWriter('curvepath2modified');
    open(writerObj);
end

%%
omega_s=2*pi/8;
N=17;%number of modules
L=2;
Am=1.2;
set(gca,'xtick',x_min:20:x_max,'ytick',y_min:20:y_max);


angle=Am*sin(omega_s*(1:N-1)');


alpha=@(t) Am*sin(t);

conf_list=[];%configuration list; storing all the nodes
%start simulation part
activation=zeros(1,N);

T=100;%number of time steps
dt=2*pi/T;

joint_index=(1:N-1)';%joint index
q_h=[-3.6;-6.8;pi/2+pi/11];
g_h=[cos(q_h(3)),-sin(q_h(3)),q_h(1);sin(q_h(3)),cos(q_h(3)),q_h(2);0,0,1];
[h, com]=drawActiveSnake(q_h(1),q_h(2),q_h(3),angle,2,activation);
F=[eye(2),[L;0];0 0 1];
counter = 1;
peg_spacing=8;
[peg_X,peg_Y] = meshgrid(x_min:peg_spacing:x_max,y_min:peg_spacing:y_max);
peg_X = peg_X(:);
peg_Y = peg_Y(:);
scatter(peg_X,peg_Y,10,'r','fill');
plot(peg_X,peg_Y,'.');
voronoi(peg_X,peg_Y);

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

title('curve path');
xlabel('X','fontsize',15);
ylabel('Y','fontsize',15);
K=diag([1;4;1]);%friction profilen
activation=ones(1,N);

%% path1
m=linspace(-6.4,80,180);
n=4*sin(m/2.6-3.04)-9.9980;
%n=-5*sin(m/3+3.204)-4.204;
%% path2
o=linspace(107.1552,140,400);
p=(o-107.1552)+(-7.3280)-4*sin((o-107.1552)/3);
%% path3
q=linspace(2.7319,7.66,400);
r=1.2316*ones(1,400);
%% path4
s=linspace(7.67,12);
t=-(s-7.6714).^2+1.2316;
%% combination_paths
n=[n];
m=[m];
plot(m,n);
%% Parameters for Tuning
buffer_length=20;
angle_sector=10;
com3 = com;
angle_buffer=Am*sin(omega_s*(1:1/buffer_length:N-1));
buffer=Init_Buffer(angle_buffer',buffer_length,N);
counter=0;
%%
while t<2*pi*50
    t = t+dt;
%     if((g_h(1,3)>103.155)&&(counter==0))
%      counter=1;
%      buffer_length=27;
%      angle_buffer=[];
%      for b=1:N-2
%      angle_buffer=[angle_buffer,linspace(angle(b),angle(b+1),buffer_length)];
%      end
%      buffer=Init_Buffer(angle_buffer',buffer_length,N);
%     end
    g=framesInHead(angle,L);
    next_headang = linspace(angle(1),find_nex_headang(g_h,m,n,g,L),150);
   
   
    [buffer,angle2]=find_angles(buffer,t,next_headang(angle_sector),N);
    diff_angles = (angle2-angle)/dt;
    %disp(diff_angles);
    if recording
        frame = getframe(gcf);
        writeVideo(writerObj,frame);
    end
    %conf=forwardSim(conf, alpha(joint_index, conf.t), alpha(joint_index, conf.t+dt), d_alpha(joint_index, conf.t), activation, dt, L,  K ,g_h,peg_spacing);
    conf=forwardSim(conf, angle, angle2, diff_angles, activation, dt, L,  K ,g_h,peg_spacing);
    %%
    %compute vc in head
    %vc_in_head=vcInHead(alpha(joint_index, conf.t), L);
    vc_in_head=vcInHead(angle2, L);
    g_h=conf.g/vc_in_head;%move the head
    q_h=[g_h(1,3);g_h(2,3);atan2(g_h(2,1),g_h(1,1))];
    neck=g_h*F;
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
    
    angle = angle2;
end
if recording
    close(writerObj);
end
% end