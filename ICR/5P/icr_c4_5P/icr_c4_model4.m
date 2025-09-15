%% This code shows ICR for the C4 vertabrae for Model4_APSlide_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[-0.336484 0.784585 1.36489 1.95896 2.36289 2.99548 3.4685 3.96035 4.38578 4.82756 5.16962 5.34689 5.5659 5.78417 5.95908 6.18503 6.29955 6.48661 6.6626 6.80724 6.95733 ];
%aa2=441.284+[];
aa3=-708.334+[0.417106 -0.414679 -0.232416 -0.0474137 0.0815022 0.27572 0.410991 0.540413 0.644084 0.753789 0.848338 0.901715 0.969763 1.03731 1.09209 1.16472 1.20076 1.25856 1.31125 1.3534 1.39523 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[-0.336827 0.720808 1.23178 1.73971 2.07763 2.59796 2.98049 3.3694 3.699 4.03296 4.28157 4.40646 4.56228 4.71516 4.83616 4.98981 5.06725 5.19339 5.31128 5.40716 5.50623 ];
%ab2=441.319+[];
ab3=-708.522+[0.433112 -1.46731 -1.78964 -2.08151 -2.26673 -2.54566 -2.75713 -2.99311 -3.20836 -3.44312 -3.6302 -3.72854 -3.84219 -3.95645 -4.04816 -4.16822 -4.23011 -4.33169 -4.42777 -4.50805 -4.59243 ];

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
figure (6)
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

title('ICR of C4 vertabrae - model 4 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ce=plot(point3,point4,'oc');
% hold on


ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end
