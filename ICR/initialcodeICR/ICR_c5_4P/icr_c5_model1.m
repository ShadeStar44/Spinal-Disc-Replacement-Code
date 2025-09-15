%% This code shows ICR for the C5 vertabrae for Model1_SlideSlide_tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.37082 0.305179 0.350143 0.331068 0.255213 0.113985 -0.108702 -0.25594 -0.449029 -0.529418 -0.680545 -0.802056 -0.94061 -1.05779 -1.16822 -1.27897 -1.38623 -1.48861 -1.58535 -1.66523 -1.72406 ];
aa3=-728.01+[-0.235198 -0.60238 -0.713245 -0.882119 -1.10835 -1.27656 -1.5345 -1.7309 -2.00945 -2.13106 -2.36611 -2.56205 -2.79134 -2.99081 -3.184 -3.38582 -3.58838 -3.78923 -3.98594 -4.15278 -4.279 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.421971 0.344927 0.380486 0.339052 0.227432 0.0582801 -0.211376 -0.395048 -0.641759 -0.746836 -0.947916 -1.11349 -1.3068 -1.47435 -1.63605 -1.8028 -1.96857 -2.13153 -2.29026 -2.42487 -2.52648 ];
ab3=-726.226+[-0.736007 -0.957922 -0.96274 -0.915088 -0.847419 -0.814265 -0.769223 -0.754244 -0.749837 -0.750141 -0.753775 -0.758777 -0.764891 -0.770643 -0.776526 -0.783632 -0.792282 -0.801422 -0.810329 -0.817657 -0.822924 ];

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
figure (3)
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

title('ICR of C5 vertabra - model 1  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
cb=plot(point3,point4,'or')
hold on
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
title('ICR of C5 vertabra under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')