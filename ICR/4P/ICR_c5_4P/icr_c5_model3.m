%% This code shows ICR for the C5 vertabrae for Model3_APSlide_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.230223 0.248088 0.336758 0.435626 0.559145 0.64437 0.731807 0.753632 0.747078 0.734824 0.69149 0.634447 0.575363 0.527892 0.455374 0.348787 0.2795 0.187271 0.085814 -0.0199565 -0.0960277 ];
aa3=-728.01+[-0.569053 -0.603672 -0.63267 -0.64874 -0.715825 -0.790576 -0.888536 -0.97355 -1.08214 -1.13472 -1.26397 -1.40171 -1.52476 -1.61657 -1.74178 -1.91125 -2.02388 -2.1804 -2.35629 -2.53937 -2.66957 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.273795 0.290838 0.379716 0.479001 0.595335 0.670463 0.743511 0.753747 0.73169 0.711601 0.647624 0.566463 0.48391 0.417755 0.319041 0.176298 0.0827864 -0.044066 -0.186322 -0.336795 -0.446097 ];
ab3=-726.226+[-0.949767 -0.973835 -1.00417 -1.02471 -1.0133 -0.985223 -0.94715 -0.929792 -0.910008 -0.900949 -0.876438 -0.847704 -0.819808 -0.798026 -0.772381 -0.747179 -0.736665 -0.725695 -0.715285 -0.705864 -0.699759 ];

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
figure (6)
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

title('ICR of C5 vertabra - model 3  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cd=plot(point3,point4,'ob');
% hold on

cd=animatedline('color','b','marker','o');
for n=1:1:k-2
addpoints(cd,point3(n),point4(n));
drawnow
end
