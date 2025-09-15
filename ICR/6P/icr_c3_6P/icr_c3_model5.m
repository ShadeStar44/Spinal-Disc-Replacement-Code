%% This code shows ICR for the C3 vertabrae for Model5_LatSlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[0.457088 0.503498 0.621954 0.755409 0.867818 1.03395 1.26937 1.42953 1.65632 1.87967 2.11968 2.39604 2.64723 2.96444 3.32289 3.50424 3.79455 4.08697 4.63317 4.70376 4.9171 ];
aa2=442.794+[2.51448 2.52422 2.60536 2.70059 2.78336 2.90672 3.07778 3.18986 3.33903 3.46706 3.58554 3.70644 3.80163 3.90334 4.00004 4.04484 4.11139 4.17243 4.27765 4.29096 4.33023 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[0.497935 0.553212 0.699364 0.867085 1.01219 1.23221 1.55475 1.78085 2.10765 2.43218 2.77993 3.1803 3.54143 3.99287 4.50099 4.759 5.17343 5.59236 6.38254 6.48576 6.7989 ];
ab2=442.825+[2.00619 1.91711 1.74104 1.56703 1.42279 1.21227 0.915601 0.715995 0.441032 0.186813 -0.0622521 -0.324843 -0.540397 -0.788616 -1.05209 -1.18212 -1.38692 -1.58985 -1.96458 -2.01284 -2.15836 ];
% ab3=-689.315+[];

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
figure (7)
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

title('ICR of C3 vertabrae - model 5 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cf=plot(point3,point4,'om');
% hold on

cf=animatedline('color','m','marker','o');
for n=1:1:k-2
addpoints(cf,point3(n),point4(n));
drawnow
end
