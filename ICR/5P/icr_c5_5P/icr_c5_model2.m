%% This code shows ICR for the C5 vertabrae for Model2_Slideslide_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.205671 -0.237976 -0.302445 -0.350517 -0.364468 -0.35899 -0.2617 -0.21588 -0.103189 0.0955939 0.230931 0.382067 0.590738 0.786442 0.991648 1.19752 1.38088 1.57136 1.74336 1.92088 2.09617 ];
%aa2=443.093+[];
aa3=-723+[-0.708411 -0.790463 -0.748825 -0.676377 -0.631863 -0.55097 -0.416211 -0.374399 -0.290165 -0.171323 -0.0989134 -0.0230073 0.0762956 0.165286 0.254154 0.342776 0.423474 0.505989 0.581815 0.666083 0.754895 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.206166 -0.238213 -0.303454 -0.354432 -0.37104 -0.372575 -0.293457 -0.25508 -0.160232 0.00728024 0.119805 0.24375 0.411521 0.565797 0.726416 0.885605 1.02511 1.16907 1.30006 1.43474 1.56691 ];
%ab2=443.207+[];
ab3=-722.896+[-0.637283 -0.792453 -0.896434 -0.99233 -1.04324 -1.13803 -1.30657 -1.36158 -1.478 -1.64674 -1.7533 -1.86938 -2.02784 -2.17325 -2.31785 -2.46121 -2.58756 -2.71411 -2.81885 -2.91909 -3.01114 ];

for n=2:k
ua1(n-1)=[aa1(n)-aa1(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub1(n-1)=[ab1(n)-ab1(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua3(n)/ua1(n);
    yb1(n)=ub3(n)/ub1(n);
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
m2=[ab1(n)+.5*ub1(n)-aa1(n)-.5*ua1(n);ab3(n)+.5*ub3(n)-aa3(n)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra1=aa1(n)+.5*ua1(n)+t2*ya1(n);
ra3=aa3(n)+.5*ua3(n)-t2;


plot(ra1,ra3,'g')
hold on

j1=aa1(n)+T*ua1(n);
k1=aa3(n)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab1(n)+.5*ub1(n)+t*yb1(n);
rb3=ab3(n)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab1(n)+T*ub1(n);
k2=ab3(n)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

% hold on
% plot(ab1,ab3,'ok')
% hold on 
% plot(aa1,aa3,'ok')

title('ICR of C4 vertabrae - model 2 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cc=plot(point3,point4,'og');
% hold on

cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end