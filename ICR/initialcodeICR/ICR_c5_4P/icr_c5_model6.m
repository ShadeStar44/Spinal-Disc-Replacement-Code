%% This code shows ICR for the C5 vertabrae for Model6_LatSlide_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.215936 0.127616 0.0693969 -0.162388 -0.368715 -0.57732 -0.738955 -0.893472 -1.08048 -1.14567 -1.25159 -1.33891 -1.41074 -1.49645 -1.58443 -1.65038 -1.72396 -1.79099 -1.87105 -1.91724 -1.96387 ];
aa3=-728.01+[0.705732 -0.803185 -0.9464 -1.29211 -1.53713 -1.80823 -2.04439 -2.28948 -2.61268 -2.7337 -2.93843 -3.11382 -3.26236 -3.44666 -3.64223 -3.79418 -3.96819 -4.13115 -4.32976 -4.44656 -4.56718 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.276618 0.144478 0.0667503 -0.222973 -0.472552 -0.7306 -0.937416 -1.14185 -1.40031 -1.49385 -1.64992 -1.78235 -1.89396 -2.03095 -2.17557 -2.28727 -2.41524 -2.53524 -2.68251 -2.76961 -2.85971 ];
ab3=-726.226+[0.0867236 -0.920006 -0.887016 -0.796381 -0.766637 -0.757114 -0.760222 -0.767713 -0.77904 -0.78371 -0.791466 -0.798188 -0.803903 -0.811392 -0.820233 -0.827212 -0.83497 -0.841781 -0.849731 -0.854152 -0.858215 ];

for n=2:k
ua2(n-1)=[aa2(n)-aa2(1)];
ua3(n-1)=[aa3(n)-aa3(1)];
ub2(n-1)=[ab2(n)-ab2(1)];
ub3(n-1)=[ab3(n)-ab3(1)];
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
figure (9)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab2(1)+.5*ub2(n)-aa2(1)-.5*ua2(n);ab3(1)+.5*ub3(n)-aa3(1)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(1)+.5*ua2(n)+t2*ya1(n);
ra3=aa3(1)+.5*ua3(n)-t2;


plot(ra2,ra3,'g')
hold on

j1=aa2(1)+T*ua2(n);
k1=aa3(1)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab2(1)+.5*ub2(n)+t*yb1(n);
rb3=ab3(1)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(1)+T*ub2(n);
k2=ab3(1)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end
hold on
point3=point1(1,2:20)
point4=point2(1,2:20)
plot(point3,point4,'ob');

title('ICR of C5 vertabra - model 6  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
cg=plot(point3,point4,'oy')
hold on
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
title('ICR of C5 vertabra under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')