%% This code shows ICR for the C4 vertabrae for Model15_Intact/TLC_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[0.489855 0.88051 1.20918 1.5678 1.95011 2.25324 2.60452 2.91678 3.17154 3.40965 3.64937 3.85635 4.0337 4.21542 4.40558 4.56267 4.70202 4.86197 5.00368 5.1204 5.24104 ];
aa2=441.02+[-0.519945 -0.713549 -0.865288 -1.04856 -1.17849 -1.26246 -1.3555 -1.42887 -1.50244 -1.5863 -1.68006 -1.76616 -1.85238 -1.9583 -2.08505 -2.19677 -2.29953 -2.42425 -2.5389 -2.63751 -2.74506 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[0.447655 0.774135 1.03699 1.31734 1.61111 1.83921 2.10324 2.33665 2.52412 2.69623 2.86506 3.00676 3.12607 3.24518 3.36679 3.46513 3.55098 3.64786 3.73202 3.79964 3.86796 ];
ab2=441.349+[-0.0756921 0.323504 0.640547 0.923696 1.23571 1.48244 1.72985 1.92795 2.07566 2.20261 2.32742 2.43545 2.51662 2.58873 2.65443 2.70511 2.74766 2.79162 2.82819 2.85721 2.88436 ];
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
figure (2)
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

title('ICR of C4 vertabrae - Intact model under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

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

