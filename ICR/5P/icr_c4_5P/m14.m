%% This code shows ICR for the C4 vertabrae for Model14_Fixed_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[-0.231045 0.0820113 0.708644 1.01967 1.58139 2.09645 2.47807 2.91223 3.38949 3.84813 4.22337 4.76 5.05036 5.50025 5.75391 6.03955 6.2327 6.43192 6.61836 6.77599 6.90009 ];
%aa2=441.284+[];
aa3=-708.334+[-0.192903 -0.291954 -0.0241916 0.0826817 0.24418 0.370789 0.460212 0.561393 0.671682 0.775516 0.856636 0.966104 1.02443 1.11784 1.1799 1.26072 1.31681 1.37622 1.43014 1.4733 1.50586];
% left hand side node: 31324
% original coords.
ab1=9.66499+[-0.231875 0.0683145 0.641069 0.915848 1.40226 1.83947 2.15782 2.51426 2.89938 3.26252 3.55501 3.96516 4.18446 4.51883 4.7008 4.90439 5.039 5.17412 5.29804 5.40229 5.48406];
%ab2=441.319+[];
ab3=-708.522+[-0.211065 -0.723104 -1.12683 -1.30852 -1.61449 -1.87923 -2.06992 -2.2828 -2.51296 -2.73683 -2.92656 -3.20679 -3.3618 -3.60613 -3.74623 -3.89953 -4.0068 -4.12068 -4.23054 -4.32408 -4.39828 ];

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
figure (10)
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

title('ICR of C4 vertabrae - model 13 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ci=plot(point3,point4,'*g');
% hold on

ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','*')

xlabel('x-coords (mm)')
ylabel('z-coords(mm)')
title('ICR of C4 vertabrae under lateral bending (5P)')
leg=[ca,ce,ci];
legend(leg,'intact','model 4','model 14','location','northeast')

