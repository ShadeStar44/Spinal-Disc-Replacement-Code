%% This code shows ICR for the C3 vertabrae for Model6_APSlide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[-0.355064 0.157374 0.750572 1.38206 2.05948 2.52288 3.14095 3.81062 4.17815 4.64003 4.96548 5.30332 5.55999 5.81833 6.03107 6.27904 6.48691 6.60037 6.78121 6.9204 7.03355 ];
aa2=442.794+[2.51017 2.28857 2.34772 2.43112 2.50488 2.53921 2.58116 2.63461 2.68628 2.78491 2.87737 2.98932 3.08478 3.18693 3.27425 3.37609 3.45693 3.50094 3.56916 3.61818 3.65414 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[-0.355744 0.20336 0.87829 1.62745 2.45516 3.02987 3.80766 4.66371 5.14396 5.76274 6.21086 6.68751 7.05934 7.44327 7.76809 8.15741 8.48845 8.67432 8.98019 9.22202 9.42362 ];
ab2=442.825+[2.28252 1.61964 1.0929 0.519758 -0.0854629 -0.47639 -0.969035 -1.44571 -1.68469 -1.96194 -2.14696 -2.33496 -2.47788 -2.62734 -2.75842 -2.92662 -3.0782 -3.16736 -3.32646 -3.46062 -3.58068 ];
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

title('ICR of C3 vertabrae - model 6 under axial rotation (6P)')
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
