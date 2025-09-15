%% This code shows ICR for the C4 vertabrae for Model5_Latlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[0.198931 0.22378 0.28247 0.350939 0.412718 0.511388 0.667957 0.785668 0.96785 1.15787 1.36994 1.62694 1.86695 2.17129 2.51858 2.69585 2.98184 3.27319 3.82702 3.89962 4.12013 ];
aa2=441.02+[0.897475 0.83418 0.699788 0.565159 0.452602 0.289011 0.0642252 -0.0844298 -0.287217 -0.472794 -0.657941 -0.861689 -1.03785 -1.2494 -1.48029 -1.59494 -1.77456 -1.95178 -2.27886 -2.32101 -2.44797 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[0.158942 0.179366 0.221372 0.267667 0.308018 0.370498 0.467272 0.539689 0.654134 0.776602 0.916866 1.09151 1.25854 1.47304 1.71931 1.84448 2.04579 2.25031 2.63498 2.68487 2.8359 ];
ab2=441.349+[1.36165 1.35935 1.41541 1.4967 1.57108 1.69078 1.87135 1.99392 2.15793 2.30068 2.43145 2.55708 2.64822 2.74001 2.82387 2.86279 2.92173 2.97746 3.077 3.08979 3.12771 ];
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
figure (7)
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

title('ICR of C4 vertabrae - model 5 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cf=plot(point3,point4,'om');
% hold on

cf=animatedline('color','m','marker','o');
for n=1:1:k-2
addpoints(cf,point3(n),point4(n));
drawnow
end
