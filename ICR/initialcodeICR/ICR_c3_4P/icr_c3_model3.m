%% This code shows ICR for the C3 vertabrae for Model3_APSlide_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.04011 1.94723 1.72686 1.49117 1.1803 0.924747 0.591009 0.236721 -0.203384 -0.408554 -0.90244 -1.42866 -1.89734 -2.24589 -2.71639 -3.33083 -3.72084 -4.24398 -4.81526 -5.39788 -5.80767 ];
aa3=-695.382+[-0.939582 -1.07569 -1.30981 -1.52929 -1.79981 -1.99689 -2.23966 -2.48574 -2.78049 -2.91365 -3.22292 -3.54564 -3.8301 -4.04076 -4.32685 -4.70681 -4.95589 -5.29949 -5.68374 -6.08362 -6.36988 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.08607 1.98097 1.72939 1.45591 1.0914 0.791954 0.398895 -0.0186023 -0.539495 -0.782763 -1.36957 -1.99984 -2.56558 -2.98914 -3.56436 -4.32073 -4.80514 -5.46102 -6.18479 -6.9306 -7.46014 ];
ab3=-693.523+[-1.51516 -1.51416 -1.44505 -1.3558 -1.25492 -1.18551 -1.10646 -1.04512 -0.985798 -0.963736 -0.919865 -0.882169 -0.856589 -0.84182 -0.830584 -0.834115 -0.847352 -0.876337 -0.920687 -0.978761 -1.0269 ];

% creating a displacement vector (node 27616,29008)from nth time increment to
% initial position.
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
figure (6)
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

title('ICR of C3 vertabra - model 3  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
cd=plot(point3,point4,'ob')

leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
hold on
title('ICR of C3 vertabra - model 3 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')