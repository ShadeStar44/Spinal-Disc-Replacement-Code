%% This code shows ICR for the C5 vertabrae for Model15_Intact/TLC_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[0.13272 0.278373 0.531139 0.642066 0.90509 1.08048 1.29544 1.54979 1.69754 1.87408 2.00982 2.11717 2.2135 2.31529 2.39798 2.47951 2.54922 2.63619 2.71076 2.77131 2.83949 ];
%aa2=443.093+[];
aa3=-723+[-0.428434 -0.284449 -0.098892 -0.0237679 0.144769 0.250944 0.374847 0.513087 0.591831 0.688012 0.768385 0.841626 0.908958 0.975737 1.03082 1.08787 1.13807 1.20028 1.25288 1.29526 1.34299 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[0.128733 0.26011 0.479605 0.572907 0.78812 0.92673 1.0921 1.28274 1.39084 1.51711 1.61204 1.68351 1.74697 1.81903 1.87712 1.93349 1.9809 2.03956 2.08964 2.12977 2.17452 ];
%ab2=443.207+[];
ab3=-722.896+[-0.752576 -0.961415 -1.2307 -1.33629 -1.57562 -1.73339 -1.92716 -2.1501 -2.28061 -2.43702 -2.55162 -2.6428 -2.72131 -2.78847 -2.84215 -2.89368 -2.93769 -2.99306 -3.04033 -3.07942 -3.124 ];

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