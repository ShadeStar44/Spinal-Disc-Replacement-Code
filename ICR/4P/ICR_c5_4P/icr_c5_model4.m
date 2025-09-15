%% This code shows ICR for the C5 vertabrae for Model4_APSlide_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.215833 -0.136849 -0.415395 -0.667152 -0.787833 -0.934178 -1.03399 -1.13114 -1.23383 -1.32838 -1.41394 -1.51346 -1.57812 -1.63914 -1.71401 -1.76921 -1.8365 -1.89949 -1.95714 -1.99899 -2.04898 ];
aa3=-728.01+[0.706185 -1.02106 -1.39069 -1.73287 -1.92219 -2.17488 -2.3568 -2.5391 -2.74121 -2.93045 -3.108 -3.32751 -3.47532 -3.6183 -3.80165 -3.94045 -4.11185 -4.27516 -4.42854 -4.54132 -4.67787 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.276509 -0.151421 -0.493589 -0.807007 -0.963077 -1.15902 -1.29674 -1.43382 -1.58289 -1.72325 -1.85387 -2.01224 -2.11822 -2.22051 -2.35032 -2.44868 -2.57119 -2.68882 -2.79962 -2.88177 -2.98205 ];
ab3=-726.226+[0.0872683 -0.860135 -0.776977 -0.754227 -0.75527 -0.763109 -0.770207 -0.777981 -0.787952 -0.797216 -0.805757 -0.815006 -0.821585 -0.828208 -0.836743 -0.842932 -0.850371 -0.857086 -0.863039 -0.86699 -0.871156 ];

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
figure (7)
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

title('ICR of C5 vertabra - model 4  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ce=plot(point3,point4,'oc');
% hold on

ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end