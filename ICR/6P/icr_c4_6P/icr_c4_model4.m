%% This code shows ICR for the C4 vertabrae for Model4_APlide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[-0.332218 0.833735 1.51819 1.99199 2.34258 2.70122 3.09085 3.48388 3.74951 4.02636 4.31528 4.59255 4.7322 5.00312 5.14725 5.35369 5.51796 5.62952 5.78356 5.93763 6.07945 ];
aa2=441.02+[1.10407 -0.390825 -1.12812 -1.52273 -1.72727 -1.86947 -1.99251 -2.1111 -2.20094 -2.3106 -2.44702 -2.5927 -2.67369 -2.84715 -2.94605 -3.09883 -3.22477 -3.31323 -3.44047 -3.57202 -3.70071 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[-0.337085 0.705465 1.25968 1.62388 1.88737 2.15456 2.44061 2.72658 2.91605 3.10884 3.30359 3.48468 3.57423 3.74419 3.83289 3.95706 4.05362 4.11784 4.20506 4.29108 4.36811 ];
ab2=441.349+[1.30323 0.763223 0.785966 0.944581 1.12678 1.34171 1.58097 1.79035 1.92124 2.04774 2.16913 2.27829 2.32704 2.41083 2.45046 2.50145 2.54021 2.56547 2.59668 2.62349 2.64439 ];
% ab3=-706.583+[];

for n=2:k
ua1(n-1)=[aa1(n)-aa1(n-1)];
ua2(n-1)=[aa2(n)-aa2(n-1)];
ub1(n-1)=[ab1(n)-ab1(n-1)];
ub2(n-1)=[ab2(n)-ab2(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua2(n)/ua1(n);
    yb1(n)=ub2(n)/ub1(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];


T=linspace(0,1,10000);

%% 0-2 Nm
figure (6)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab1(n)+.5*ub1(n)-aa1(n)-.5*ua1(n);ab2(n)+.5*ub2(n)-aa2(n)-.5*ua2(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra1=aa1(n)+.5*ua1(n)+t2*ya1(n);
ra3=aa2(n)+.5*ua2(n)-t2;


plot(ra1,ra3,'g')
hold on

j1=aa1(n)+T*ua1(n);
k1=aa2(n)+T*ua2(n);
plot(j1,k1,'c')
hold on

rb2=ab1(n)+.5*ub1(n)+t*yb1(n);
rb3=ab2(n)+.5*ub2(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab1(n)+T*ub1(n);
k2=ab2(n)+T*ub2(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

hold on
plot(ab1,ab2,'ok')
hold on 
plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - model 4 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ce=plot(point3,point4,'oc');
% hold on

ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')
