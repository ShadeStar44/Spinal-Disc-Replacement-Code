%% This code shows ICR for the C4 vertabrae for Model1_Slideslide_Tether6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[-0.258692 -0.0476271 0.25338 0.673656 1.08426 1.60068 2.139 2.70046 3.0152 3.50352 3.8699 4.08437 4.36184 4.6286 4.87757 5.13298 5.28141 5.54772 5.71967 5.83698 5.97748 ];
aa2=441.02+[1.19837 0.79083 0.40023 -0.0481423 -0.423041 -0.840826 -1.23874 -1.62097 -1.82102 -2.10873 -2.31214 -2.42802 -2.57587 -2.71936 -2.85672 -3.00472 -3.09505 -3.26599 -3.38458 -3.46711 -3.57071 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[-0.266466 -0.0831597 0.165167 0.497226 0.81657 1.21979 1.63836 2.07165 2.31092 2.67342 2.93743 3.08876 3.28058 3.46038 3.62416 3.78793 3.88092 4.04325 4.14472 4.21289 4.29287 ];
ab2=441.349+[1.38566 1.29639 1.37241 1.53107 1.6726 1.79308 1.88153 1.94436 1.98458 2.07051 2.15269 2.20628 2.2807 2.35666 2.42895 2.50202 2.54338 2.61583 2.65979 2.68877 2.72128 ];
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
figure (3)
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

title('ICR of C4 vertabrae - model 1 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cb=plot(point3,point4,'or');
% hold on

cb=animatedline('color','r','marker','o');
for n=1:1:k-2
addpoints(cb,point3(n),point4(n));
drawnow
end
