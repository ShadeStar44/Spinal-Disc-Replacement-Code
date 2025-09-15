%% This code shows ICR for the C5 vertabrae for Model1_Slideslide_Tether_6P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.243944 -0.25151 -0.248034 -0.193245 -0.081777 0.111335 0.338746 0.583782 0.722586 0.935508 1.09312 1.18485 1.30181 1.41411 1.5186 1.62594 1.68802 1.79848 1.86867 1.916 1.97211 ];
aa2=443.093+[0.530189 0.244224 0.030473 -0.167544 -0.32638 -0.528138 -0.739178 -0.961159 -1.0771 -1.24815 -1.36949 -1.43814 -1.52464 -1.60861 -1.68883 -1.77569 -1.82862 -1.92777 -1.99579 -2.04297 -2.10179 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.243352 -0.243729 -0.233162 -0.175777 -0.0690845 0.109765 0.314673 0.529937 0.649572 0.828843 0.958145 1.03214 1.12508 1.21275 1.29294 1.37381 1.41982 1.50019 1.5501 1.5833 1.62205];
ab2=442.054+[0.522988 0.414294 0.475269 0.658623 0.849268 1.0328 1.18198 1.28935 1.35026 1.45222 1.53667 1.58868 1.65724 1.72552 1.78988 1.85546 1.89297 1.95984 2.00181 2.02974 2.06224];
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
figure (3)
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

% blue dots at ICR
hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

% block dots on displacement vectors
% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - model 1 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cb=plot(point3,point4,'or');
% hold on

cb=animatedline('color','r','marker','o');
for n=1:1:k-2
addpoints(cb,point3(n),point4(n));
drawnow
end

