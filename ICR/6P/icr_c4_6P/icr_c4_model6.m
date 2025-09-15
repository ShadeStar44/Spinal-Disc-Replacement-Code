%% This code shows ICR for the C4 vertabrae for Model6_Latslide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[-0.332196 -0.057127 0.308328 0.748125 1.27693 1.6591 2.18678 2.7654 3.09058 3.50967 3.8122 4.13307 4.38293 4.64077 4.86069 5.12724 5.35893 5.48716 5.69702 5.86289 6.00101 ];
aa2=441.02+[1.10447 0.679083 0.243468 -0.196297 -0.650378 -0.947371 -1.3264 -1.7024 -1.8965 -2.12936 -2.28829 -2.45175 -2.57801 -2.71056 -2.8273 -2.97622 -3.10818 -3.18583 -3.32323 -3.43834 -3.53997 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[-0.337064 -0.0961805 0.207193 0.556519 0.971282 1.26991 1.67994 2.12534 2.37122 2.68081 2.89815 3.12325 3.29435 3.4669 3.61122 3.78275 3.93175 4.0114 4.13734 4.23422 4.31281];
ab2=441.349+[1.30368 1.23469 1.32261 1.47873 1.63734 1.72136 1.81593 1.90016 1.95617 2.04643 2.1261 2.22021 2.29772 2.38011 2.44965 2.53095 2.59709 2.63304 2.68989 2.73177 2.76415 ];
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
figure (8)
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

title('ICR of C4 vertabrae - model 6 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cg=plot(point3,point4,'oy');
% hold on

cg=animatedline('color','y','marker','o');
for n=1:1:k-2
addpoints(cg,point3(n),point4(n));
drawnow
end


