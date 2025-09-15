%% This code shows ICR for the C5 vertabrae for Model6_LatSlide_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.15614 -0.171332 -0.0511338 0.153735 0.329887 0.556822 0.765358 0.988306 1.21982 1.43845 1.67361 1.86908 2.01256 2.15409 2.24251 2.35343 2.41895 2.50484 2.58021 2.65697 2.72848 ];
%aa2=443.093+[];
aa3=-723+[0.250996 -0.692087 -0.56179 -0.426165 -0.32407 -0.196705 -0.0828014 0.039784 0.169371 0.291114 0.424747 0.539102 0.635713 0.738096 0.805551 0.892984 0.946494 1.01603 1.07549 1.13592 1.19225 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.158017 -0.176386 -0.068359 0.112649 0.264342 0.454287 0.625226 0.803687 0.983746 1.14955 1.32251 1.46545 1.56715 1.67165 1.73609 1.81546 1.86153 1.92137 1.97371 2.02635 2.07475 ];
%ab2=443.207+[];
ab3=-722.896+[0.335042 -1.03177 -1.20664 -1.42008 -1.58044 -1.77336 -1.93407 -2.09663 -2.26616 -2.42685 -2.60333 -2.74146 -2.83663 -2.90998 -2.9544 -3.00983 -3.04227 -3.08558 -3.12402 -3.16356 -3.20128 ];

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
