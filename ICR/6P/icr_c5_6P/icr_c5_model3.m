%% This code shows ICR for the C5 vertabrae for Model3_APSlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.088949 -0.0846461 -0.10263 -0.129187 -0.149874 -0.175483 -0.198546 -0.202407 -0.17924 -0.136487 -0.0926997 0.0049612 0.124348 0.208553 0.350833 0.457886 0.588854 0.746675 0.830774 0.978352 1.09358 ];
aa2=443.093+[0.246163 0.213896 0.147915 0.0875963 0.0405457 -0.022931 -0.100243 -0.150481 -0.22162 -0.292699 -0.35278 -0.466132 -0.595101 -0.681263 -0.822448 -0.922299 -1.03946 -1.17228 -1.24127 -1.35998 -1.45136 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.0817046 -0.0763431 -0.0911974 -0.114538 -0.132877 -0.155887 -0.177819 -0.182924 -0.164653 -0.129607 -0.0934767 -0.0114288 0.089745 0.161274 0.281274 0.371085 0.479865 0.609823 0.678387 0.797638 0.889784 ];
ab2=442.054+[0.443229 0.44044 0.469636 0.526829 0.586093 0.691556 0.867636 0.992885 1.1884 1.34481 1.45019 1.59729 1.70625 1.76129 1.83892 1.8891 1.94784 2.01479 2.04956 2.1087 2.15342 ];
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
figure (5)
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

title('ICR of C4 vertabrae - model 3 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cd=plot(point3,point4,'ob');
% hold on

cd=animatedline('color','b','marker','o');
for n=1:1:k-2
addpoints(cd,point3(n),point4(n));
drawnow
end
