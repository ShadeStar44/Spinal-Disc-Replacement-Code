%% This code shows ICR for the C5 vertabrae for Model13_Fixed_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.147525 0.156687 0.216756 0.290456 0.380778 0.473519 0.569202 0.65774 0.732968 0.765664 0.777638 0.776376 0.765392 0.749199 0.731376 0.700808 0.664275 0.614769 0.55934 0.491868 0.447488 ];
aa3=-728.01+[-0.146383 -0.165965 -0.183434 -0.191172 -0.198775 -0.240676 -0.302063 -0.371096 -0.443426 -0.506196 -0.574325 -0.648284 -0.740486 -0.811042 -0.876465 -0.966459 -1.05796 -1.16776 -1.27791 -1.4015 -1.47907 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.20404 0.213044 0.273927 0.348761 0.440018 0.52923 0.618184 0.698537 0.764744 0.790201 0.794058 0.783387 0.759708 0.733062 0.704976 0.659436 0.606637 0.536766 0.460057 0.367702 0.307163 ];
ab3=-726.226+[-0.682502 -0.698976 -0.725623 -0.7472 -0.765852 -0.761494 -0.741241 -0.716408 -0.691543 -0.680901 -0.670895 -0.658803 -0.641402 -0.626543 -0.611731 -0.590308 -0.567367 -0.542128 -0.519298 -0.496181 -0.482832 ];

for n=2:k
ua2(n-1)=[aa2(n)-aa2(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub2(n-1)=[ab2(n)-ab2(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua3(n)/ua2(n);
    yb1(n)=ub3(n)/ub2(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];

t=linspace(0,30.0681,10000);
T=linspace(0,1,10000);

%% 0-2 Nm
figure (10)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab2(n)+.5*ub2(n)-aa2(n)-.5*ua2(n);ab3(n)+.5*ub3(n)-aa3(n)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(n)+.5*ua2(n)+t2*ya1(n);
ra3=aa3(n)+.5*ua3(n)-t2;


plot(ra2,ra3,'g')
hold on

j1=aa2(n)+T*ua2(n);
k1=aa3(n)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab2(n)+.5*ub2(n)+t*yb1(n);
rb3=ab3(n)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(n)+T*ub2(n);
k2=ab3(n)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end
hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

title('ICR of C5 vertabra - model 13  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ch=plot(point3,point4,'*r');
% hold on
ch=animatedline('color','r','marker','*');
for n=1:1:k-2
addpoints(ch,point3(n),point4(n));
drawnow
end
