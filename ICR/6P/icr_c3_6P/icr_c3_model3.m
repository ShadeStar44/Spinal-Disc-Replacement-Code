%% This code shows ICR for the C3 vertabrae for Model3_APSlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[0.470625 0.518853 0.64222 0.78078 0.897179 1.06857 1.31072 1.47501 1.74127 1.98709 2.17639 2.49857 2.82731 3.04123 3.38552 3.63578 3.93554 4.28553 4.46802 4.78086 5.02047];
aa2=442.794+[2.47248 2.48225 2.56659 2.66638 2.75277 2.87995 3.05404 3.16684 3.33605 3.46918 3.55866 3.693 3.80819 3.87145 3.96343 4.02142 4.08749 4.15766 4.19288 4.25097 4.29407 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[0.509712 0.566897 0.718317 0.891851 1.04174 1.2684 1.5998 1.83136 2.21448 2.5704 2.84365 3.30744 3.77615 4.07844 4.56599 4.92023 5.34777 5.84956 6.11315 6.56787 6.91924 ];
ab2=442.825+[1.98052 1.8894 1.71038 1.53387 1.38749 1.17378 0.871915 0.669263 0.350996 0.079716 -0.112043 -0.409265 -0.677854 -0.839618 -1.09097 -1.26767 -1.47695 -1.71814 -1.84318 -2.05647 -2.21935 ];
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

title('ICR of C3 vertabrae - model 3 under axial rotation (6P)')
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
