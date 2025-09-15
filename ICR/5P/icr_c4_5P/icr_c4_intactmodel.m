%% This code shows ICR for the C4 vertabrae for Model15_Intact/TLC_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[0.44947 0.9297 1.60468 1.87995 2.50632 2.9115 3.39909 3.95738 4.27933 4.66594 4.96657 5.2171 5.43976 5.66069 5.8392 6.01594 6.16779 6.3567 6.51711 6.64739 6.79437 ];
%aa2=441.284+[];
aa3=-707.063+[-0.438214 -0.238562 0.00331433 0.0958065 0.29319 0.409833 0.540723 0.675384 0.747494 0.832142 0.90359 0.971021 1.0316 1.0927 1.14124 1.19063 1.23337 1.28548 1.32998 1.36552 1.40433 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[0.421996 0.855553 1.44699 1.68315 2.21096 2.54505 2.93885 3.38174 3.63383 3.93231 4.15959 4.34226 4.50247 4.66376 4.79303 4.919 5.02578 5.1574 5.26775 5.35617 5.45519 ];
%ab2=441.319+[];
ab3=-707.715+[-0.878059 -1.14257 -1.46895 -1.59505 -1.88156 -2.07291 -2.3133 -2.59523 -2.76347 -2.97076 -3.13259 -3.27158 -3.39495 -3.50811 -3.60007 -3.69197 -3.77204 -3.87275 -3.95909 -4.03088 -4.11322 ];

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
figure (2)
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

title('ICR of C4 vertabrae - Intact model under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ca=plot(point3,point4,'ok');
% hold on


ca=animatedline('color','k','marker','o');
for n=1:1:k-2
addpoints(ca,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')

