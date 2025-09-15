%% This code shows ICR for the C5 vertabrae for Model2_Slideslide_NoTether_6P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.205671 -0.213179 -0.252902 -0.273332 -0.283732 -0.259649 -0.179881 -0.0764454 0.0744833 0.219984 0.403919 0.593148 0.761738 0.9578 1.07379 1.28109 1.36547 1.50875 1.60498 1.70979 1.79801 ];
aa2=443.093+[0.574548 0.467717 0.304335 0.210151 0.07904 -0.0192924 -0.127008 -0.233792 -0.393171 -0.538442 -0.718107 -0.898889 -1.0488 -1.2133 -1.30768 -1.4739 -1.54131 -1.65776 -1.73888 -1.83004 -1.90897];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.203662 -0.207757 -0.240225 -0.256663 -0.263284 -0.23992 -0.166045 -0.0721078 0.0621056 0.190164 0.35004 0.512113 0.654477 0.817481 0.912539 1.07973 1.14676 1.25897 1.33302 1.41232 1.47791 ];
ab2=442.054+[0.599672 0.572941 0.6179 0.685357 0.850564 1.03182 1.23216 1.37909 1.50696 1.58948 1.66518 1.72413 1.7765 1.84123 1.88122 1.95509 1.98563 2.03798 2.07357 2.11365 2.14841 ];
% ab3=-723.173+[];

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

t=linspace(0,30.0681,10000);
T=linspace(0,1,10000);

%% 0-2 Nm
figure (4)
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

% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - model 2 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cc=plot(point3,point4,'og');
% hold on

cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end

