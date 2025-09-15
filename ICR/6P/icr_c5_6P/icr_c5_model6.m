%% This code shows ICR for the C5 vertabrae for Model6_LatSlide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.15614 -0.268781 -0.249352 -0.171712 -0.00167592 0.147399 0.372861 0.627159 0.771409 0.954629 1.08486 1.22168 1.32661 1.43396 1.52502 1.63436 1.7229 1.77459 1.85976 1.92662 1.98158 ];
aa2=443.093+[0.343197 0.184608 -0.0538138 -0.255884 -0.465971 -0.612343 -0.812011 -1.02525 -1.13841 -1.27876 -1.37476 -1.47241 -1.54692 -1.62456 -1.69258 -1.77977 -1.857 -1.90233 -1.98135 -2.04734 -2.10478 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.150104 -0.260244 -0.233311 -0.154664 0.0065379 0.143741 0.346564 0.569499 0.693359 0.847083 0.953749 1.06364 1.14641 1.22965 1.2992 1.38123 1.44617 1.4838 1.54477 1.59172 1.62961];
ab2=442.054+[0.461014 0.368778 0.45291 0.638012 0.854271 0.981382 1.13123 1.25692 1.32769 1.42372 1.49999 1.5857 1.65314 1.72403 1.78381 1.85404 1.91024 1.94194 1.99397 2.03368 2.06587 ];
% ab3=-723.173+[];

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

% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

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
