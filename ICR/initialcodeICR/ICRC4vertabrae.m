%% This code will attempt to find the instantaneous center of rotation (ICR) of the C4 inferior endplate
% anterior node: 27616
clear variables
clf
k=21;
%original coords
%aa1=-.00519957
aa2=423.575+[-0.331104 -0.885866 -1.22595 -1.61701 -2.04949 -2.46845 -2.54011 -2.83637 -3.17414 -3.44499 -3.66533 -3.85985 -4.06901 -4.27188 -4.502 -4.70094 -4.9317 -5.05179 -5.27999 -5.41698 -5.55548 ];
aa3=-712.392+[-0.60781 -1.07008 -1.32824 -1.66043 -2.05646 -2.4645 -2.53634 -2.84107 -3.20473 -3.50943 -3.76539 -3.99678 -4.25191 -4.5044 -4.7972 -5.05798 -5.3675 -5.5317 -5.85072 -6.04631 -6.24744 ];
% posterior node: 29008
% original coords.
%ab1=.271251
ab2=448.139+[-0.30909 -0.980237 -1.39036 -1.87152 -2.41583 -2.95699 -3.05106 -3.44545 -3.90652 -4.28629 -4.60172 -4.885 -5.1954 -5.50172 -5.85581 -6.16895 -6.53988 -6.73638 -7.11699 -7.35015 -7.58967 ];
ab3=-709.304+[-0.685682 -0.597109 -0.56382 -0.552562 -0.560345 -0.581571 -0.58597 -0.606816 -0.636338 -0.663592 -0.68913 -0.71421 -0.743368 -0.77429 -0.812675 -0.848766 -0.893937 -0.918956 -0.969793 -1.00218 -1.0365 ];

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

%% .5 Nm
% system of equations that solve for the time of intersection (ICR) of the perpendicular bisectors.
m1=[ya1(5), -yb1(5);-1, 1];
m2=[ab2(1)+.5*ub2(5)-aa2(1)-.5*ua2(5);ab3(1)+.5*ub3(5)-aa3(1)-.5*ua3(5)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(1)+.5*ua2(5)+t2*ya1(5);
ra3=aa3(1)+.5*ua3(5)-t2;

figure (1)
f1=plot(ra2,ra3,'g')
hold on

j1=aa2(1)+T*ua2(5);
k1=aa3(1)+T*ua3(5);
plot(j1,k1,'g')
hold on

rb2=ab2(1)+.5*ub2(5)+t*yb1(5);
rb3=ab3(1)+.5*ub3(5)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(1)+T*ub2(5);
k2=ab3(1)+T*ub3(5);
plot(j2,k2,'g')


%% 1 Nm

m1=[ya1(10), -yb1(10);-1 1];
m2=[ab2(1)+.5*ub2(10)-aa2(1)-.5*ua2(10);ab3(1)+.5*ub3(10)-aa3(1)-.5*ua3(10)];
a=m1\m2;

t=linspace(0,a(2,1),100);
t2=linspace(0,a(1,1),100);

ra2=aa2(1)+.5*ua2(10)+t2*ya1(10);
ra3=aa3(1)+.5*ua3(10)-t2;

figure (1)
f2=plot(ra2,ra3,'k');
hold on

j1=aa2(1)+T*ua2(10);
k1=aa3(1)+T*ua3(10);
plot(j1,k1,'k');
hold on

rb2=ab2(1)+.5*ub2(10)+t*yb1(10);
rb3=ab3(1)+.5*ub3(10)-t;
plot(rb2,rb3,'k')
hold on

j2=ab2(1)+T*ub2(10);
k2=ab3(1)+T*ub3(10);
plot(j2,k2,'k')
hold on


%% 1.5 Nm
m1=[ya1(15), -yb1(15);-1, 1];
m2=[ab2(1)+.5*ub2(15)-aa2(1)-.5*ua2(15);ab3(1)+.5*ub3(15)-aa3(1)-.5*ua3(15)];
d=m1\m2;

t=linspace(0,d(2,1),100);
t2=linspace(0,d(1,1),100);

ra2=aa2(1)+.5*ua2(15)+t2*ya1(15);
ra3=aa3(1)+.5*ua3(15)-t2;

figure (1)
f3=plot(ra2,ra3,'m')
hold on

j1=aa2(1)+T*ua2(15);
k1=aa3(1)+T*ua3(15);
plot(j1,k1,'m')
hold on

rb2=ab2(1)+.5*ub2(15)+t*yb1(15);
rb3=ab3(1)+.5*ub3(15)-t;
plot(rb2,rb3,'m')
hold on

j2=ab2(1)+T*ub2(15);
k2=ab3(1)+T*ub3(15);
plot(j2,k2,'m')



%% 2 Nm
m1=[ya1(20), -yb1(20);-1, 1];
m2=[ab2(1)+.5*ub2(20)-aa2(1)-.5*ua2(20);ab3(1)+.5*ub3(20)-aa3(1)-.5*ua3(20)];
b=m1\m2;

t=linspace(0,b(2,1),100);
t2=linspace(0,b(1,1),100);

ra2=aa2(1)+.5*ua2(20)+t2*ya1(20);
ra3=aa3(1)+.5*ua3(20)-t2;

figure (1)
f4=plot(ra2,ra3,'b')
hold on

j1=aa2(1)+T*ua2(20);
k1=aa3(1)+T*ua3(20);
plot(j1,k1,'b')
hold on

rb2=ab2(1)+.5*ub2(20)+t*yb1(20);
rb3=ab3(1)+.5*ub3(20)-t;
plot(rb2,rb3,'b')
hold on

j2=ab2(1)+T*ub2(20);
k2=ab3(1)+T*ub3(20);
plot(j2,k2,'b')


xlabel('Y-coords (mm)')
ylabel('Z-coords(mm)')
title('Instantaneous Center of Rotation of C4 Inferior Endplate in Flexion (Y-Z Plane)')
legend([f1,f2,f3,f4],'.5 Nm ','1 Nm ','1.5 Nm ','2 Nm ','location','southwest')




