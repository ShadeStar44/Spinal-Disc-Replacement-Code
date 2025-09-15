%% This code shows ICR for the C4 vertabrae for Model3_APSlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[0.2189 0.24479 0.306596 0.378157 0.442351 0.544186 0.70534 0.826404 1.0422 1.25324 1.42137 1.7216 2.03536 2.24026 2.5736 2.81729 3.11286 3.46225 3.64653 3.96601 4.21324 ];
aa2=441.02+[0.895531 0.830906 0.69352 0.555478 0.439864 0.272344 0.0427722 -0.108365 -0.343561 -0.542905 -0.686557 -0.920297 -1.14537 -1.28548 -1.50675 -1.6628 -1.84711 -2.05811 -2.16742 -2.35391 -2.49607 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[0.180704 0.202051 0.246727 0.295389 0.337429 0.401953 0.501675 0.576527 0.713189 0.850858 0.96304 1.16924 1.38973 1.53531 1.77187 1.94479 2.15296 2.39776 2.52586 2.74659 2.91598 ];
ab2=441.349+[1.34191 1.34019 1.39979 1.48525 1.56252 1.68522 1.86874 1.99198 2.17829 2.32578 2.42383 2.56058 2.66653 2.72194 2.80079 2.85092 2.90901 2.97336 3.00638 3.06172 3.10328 ];
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
figure (5)
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

title('ICR of C4 vertabrae - model 3 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cd=plot(point3,point4,'ob');
% hold on

cd=animatedline('color','b','marker','o');
for n=1:1:k-2
addpoints(cd,point3(n),point4(n));
drawnow
end
