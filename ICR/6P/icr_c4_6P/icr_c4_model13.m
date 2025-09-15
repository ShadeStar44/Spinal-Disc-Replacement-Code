%% This code shows ICR for the C4 vertabrae for Model13_Fixed_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[0.273195 0.306615 0.388074 0.483059 0.604099 0.708839 0.88858 1.07259 1.32366 1.56929 1.84185 2.0813 2.39315 2.63375 3.10615 3.29298 3.63359 3.8386 4.17396 4.41702 4.65842 ];
aa2=441.02+[1.06992 0.987264 0.8156 0.64637 0.456541 0.305299 0.0809231 -0.117086 -0.352717 -0.558048 -0.765303 -0.938278 -1.15288 -1.31169 -1.60734 -1.72005 -1.92039 -2.03858 -2.22878 -2.36497 -2.49952 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[0.235484 0.263043 0.322867 0.389107 0.47023 0.537677 0.653288 0.774007 0.943126 1.11287 1.30527 1.47495 1.69767 1.86943 2.20469 2.33602 2.57386 2.71558 2.94525 3.10973 3.27132 ];
ab2=441.349+[1.49927 1.49526 1.56544 1.66488 1.79277 1.90065 2.07023 2.21725 2.379 2.50223 2.60937 2.68908 2.77224 2.82787 2.92947 2.9686 3.03819 3.07976 3.14664 3.19458 3.24147 ];
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
figure (9)
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

title('ICR of C4 vertabrae - model 13 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ch=plot(point3,point4,'*r');
% hold on

ch=animatedline('color','r','marker','*');
for n=1:1:k-2
addpoints(ch,point3(n),point4(n));
drawnow
end
