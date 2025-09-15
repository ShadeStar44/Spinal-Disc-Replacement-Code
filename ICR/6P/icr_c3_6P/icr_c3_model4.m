%% This code shows ICR for the C3 vertabrae for Model4_APSlide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[-0.355107 1.43074 2.38 2.97102 3.38115 3.79085 4.22784 4.67053 4.96231 5.25615 5.55218 5.83009 5.96662 6.22513 6.35736 6.53888 6.6789 6.77187 6.89797 7.0231 7.13498 ];
aa2=442.794+[2.51019 1.46947 1.29418 1.38151 1.56682 1.82326 2.12333 2.4014 2.57674 2.74573 2.90472 3.04436 3.10683 3.21144 3.26051 3.32305 3.37014 3.40013 3.43566 3.46364 3.48198 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[-0.355788 1.58122 2.69253 3.42604 3.95278 4.48755 5.06938 5.66519 6.06727 6.48448 6.91974 7.34045 7.55192 7.96227 8.1782 8.48442 8.72703 8.89186 9.11894 9.34629 9.5555 ];
ab2=442.825+[2.28261 0.191119 -0.818514 -1.35138 -1.60458 -1.75715 -1.87661 -1.98378 -2.069 -2.18002 -2.32715 -2.48974 -2.58156 -2.78271 -2.8982 -3.07836 -3.22721 -3.33236 -3.48434 -3.64277 -3.80025 ];
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
figure (6)
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

title('ICR of C3 vertabrae - model 4 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ce=plot(point3,point4,'oc');
% hold on

ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')
