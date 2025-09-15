%% This code shows ICR for the C4 vertabrae for Model2_SlideSlide_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[-0.185463 -0.142377 -0.0292709 0.133572 0.235258 0.449708 0.877155 1.02306 1.33731 1.81953 2.12829 2.46367 2.91693 3.3323 3.75464 4.1724 4.54154 4.918 5.24977 5.58937 5.92299 ];
%aa2=441.284+[];
aa3=-708.334+[-0.602842 -0.660792 -0.551874 -0.40975 -0.33382 -0.204076 -0.02165 0.0289219 0.12375 0.248408 0.319711 0.391802 0.482 0.559101 0.633914 0.706352 0.770802 0.835188 0.895302 0.963689 1.03726 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[-0.187677 -0.14804 -0.0479598 0.0914289 0.176886 0.356203 0.715211 0.837418 1.10014 1.50086 1.75471 2.02752 2.39099 2.71916 3.04967 3.37322 3.65576 3.94133 4.19245 4.44752 4.69536 ];
%ab2=441.319+[];
ab3=-708.522+[-0.713466 -0.902845 -1.08354 -1.26439 -1.35773 -1.52426 -1.7854 -1.86496 -2.02716 -2.25811 -2.40181 -2.55744 -2.76904 -2.96328 -3.15855 -3.35339 -3.52675 -3.70312 -3.85416 -4.00505 -4.15098 ];

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
