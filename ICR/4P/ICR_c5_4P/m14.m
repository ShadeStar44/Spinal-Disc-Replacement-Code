%% This code shows ICR for the C5 vertabrae for Model14_Fixed_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.312197 0.140094 0.0929206 -0.000857331 -0.207527 -0.368424 -0.634678 -0.740589 -0.9648 -0.995629 -1.13911 -1.23048 -1.31711 -1.42078 -1.50479 -1.59454 -1.67312 -1.76279 -1.84089 -1.93296 -1.9627 ];
aa3=-728.01+[0.19998 -0.225905 -0.428585 -0.60864 -0.893533 -1.08632 -1.43578 -1.5865 -1.93587 -1.98632 -2.23091 -2.39314 -2.55064 -2.74482 -2.90629 -3.08266 -3.24149 -3.42888 -3.59726 -3.80386 -3.87237 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.374791 0.189142 0.120319 0.00155921 -0.2501 -0.442471 -0.768268 -0.901902 -1.19477 -1.23612 -1.43276 -1.56163 -1.68631 -1.8391 -1.96586 -2.1043 -2.22857 -2.37412 -2.50438 -2.66318 -2.71576 ];
ab3=-726.226+[-0.443568 -0.683591 -0.644049 -0.59172 -0.522602 -0.500125 -0.490842 -0.490399 -0.496829 -0.49802 -0.504954 -0.509191 -0.513432 -0.518952 -0.523653 -0.528923 -0.533555 -0.539885 -0.545914 -0.553272 -0.555586 ];

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
figure (11)
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

title('ICR of C5 vertabra - model 14  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ci=plot(point3,point4,'*g');
% hold on
ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','*')

leg=[ca,ce,ci];
title('ICR of C5 vertabra under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 4','model 14','location','northwest')