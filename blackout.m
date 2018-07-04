 function blackout_nodes = blackout(target_buffer,blackout_nodes)
% a=[];
% b=[];
% c=[];
% d=[];
% e=[];
% f=[];
% g=[];
% h=[];
% j=[];
% k=[];
% 
% 
% for i=1:11%(1)
%  a= [a;vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);
%     vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%     vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%     vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vx(1,1)-vx(1,2));vx(1,i),vy(1,i)+2*norm(vx(1,1)-vx(1,2));vx(1,i),vy(1,i)+norm(vx(1,1)-vx(1,2));vx(1,i),vy(1,i)];
% 
% end 
%  adash =fliplr(a'); 
%  adash =adash';
% for i=1:10%(2)
%  b= [b;vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i);
%     vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%     vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+1*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1)); 
%     vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+1*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);
%     vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%     vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+1*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1)); 
%     vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+1*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1))];
%     
%   
% end
%   bdash =fliplr(b'); 
%   bdash =bdash';
% for i=1:11%(3)
%  c=  [c;vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);
%      vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i),vy(1,i)];
%  
% end
%  cdash =fliplr(c'); 
%  cdash =cdash';
% for i=1:10%(4)
%  d=   [d;vx(1,i),vy(1,i);vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%       vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)];
%  ddash =fliplr(d'); 
%  ddash =ddash';
% end   
%  ddash =fliplr(d'); 
%  ddash =ddash';
% for i=1:12%(5)
%  e= [e;vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vx(1,1)-vx(1,2));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1))];
%   
% end
%   edash =fliplr(e'); 
%   edash =edash';
% 
% for i=1:12%(6)
%  f=  [f;vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vx(1,1)-vx(1,2));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%     vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1))];
%   
% end
%  fdash =fliplr(f'); 
%  fdash =fdash';
% 
% for i=1:11%(7)
%  g=  [g;vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%      vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));
%      vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%      vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1))];
% 
%  
% end
%  gdash =fliplr(g'); 
%  gdash =gdash';
% for i=1:11%(8)
%  h=  [h;vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);
%      vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i),vy(1,i)+norm(vy(1,1)-vy(1,2));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%      vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));
%      vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vx(1,1)-vx(1,2))+ norm(vx(1,1)-vx(1,2));vx(1,i),vy(1,i)+norm(vx(1,1)-vx(1,2));vx(1,i),vy(1,i)+norm(vx(1,1)-vx(1,2));vx(1,i),vy(1,i)];
%  
% end 
%  hdash =fliplr(h'); 
%  hdash =hdash'; 
% 
% for i=1:12%(9)
%  
%  j=  [j;vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i),vy(1,i);
%      vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);
%      vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i);
%      vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)];
% 
% end
%  jdash =fliplr(j');
%  jdash =jdash';
% for i=1:9%(10)
%     
%   k = [k;vx(1,i),vy(1,i);vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i);vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i) ;
%       vx(1,i),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1));vx(1,i)+3*norm(vx(1,1)-vx(1,2)),vy(1,i)+norm(vy(1,1)-vy(2,1)) ;
%       vx(1,i),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+2*norm(vx(1,1)-vx(1,2)),vy(1,i)+2*norm(vy(1,1)-vy(2,1));vx(1,i)+3*norm(vx(1,1)-vx(1,2)),2*vy(1,i)+norm(vy(1,1)-vy(2,1))] ;
% 
%  
% end
%  kdash =fliplr(k');
%  kdash =kdash';
%  total_nodes=[a;b;c;d;e;f;g;h;j;k;adash;bdash;cdash;ddash;edash;fdash;gdash;hdash;jdash;kdash];
 
%  for chck=0:size(total_nodes,1)/4
%      if(round(total_nodes(4*check+1:4*check+4,1:2))==round(target_buffer(end-3:end,1:2)))
         blackout_nodes=[blackout_nodes;target_buffer(end-4:end,1:2)];
%      end
         
 end
