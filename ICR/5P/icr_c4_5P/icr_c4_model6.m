%% This code shows ICR for the C4 vertabrae for Model6_LatSlide_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[-0.336466 0.280699 0.731208 1.314 1.75822 2.29798 2.76597 3.24801 3.7403 4.19717 4.68627 5.08602 5.38756 5.68675 5.87794 6.1176 6.26115 6.45019 6.6149 6.78311 6.942 ];
%aa2=441.284+[];
aa3=-708.334+[0.415721 -0.501343 -0.318677 -0.138645 -0.0197723 0.118381 0.237519 0.360875 0.486075 0.598722 0.716127 0.81415 0.897234 0.988507 1.04768 1.12423 1.17078 1.23038 1.28025 1.33009 1.3765 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[-0.336809 0.245996 0.650826 1.16039 1.54114 1.9948 2.38113 2.77224 3.16398 3.52068 3.89433 4.19536 4.41605 4.63536 4.77307 4.941 5.03961 5.16809 5.27943 5.39212 5.49783 ];
%ab2=441.319+[];
ab3=-708.522+[0.431711 -1.24886 -1.51472 -1.827 -2.04717 -2.3038 -2.51639 -2.73089 -2.95532 -3.17133 -3.41424 -3.61579 -3.76891 -3.9124 -4.00592 -4.12697 -4.20113 -4.301 -4.38884 -4.47948 -4.56629 ];

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
figure (8)
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

title('ICR of C4 vertabrae - model 6 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cg=plot(point3,point4,'oy');
% hold on


cg=animatedline('color','y','marker','o');
for n=1:1:k-2
addpoints(cg,point3(n),point4(n));
drawnow
end
