%% This code shows ICR for the C5 vertabrae for Model4_APSlide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.156116 0.00871946 0.194311 0.355686 0.491282 0.638927 0.803045 0.96557 1.07641 1.19163 1.31027 1.42233 1.47884 1.58886 1.64773 1.73232 1.79953 1.84491 1.9072 1.96921 2.02563 ];
aa2=443.093+[0.343018 -0.392096 -0.728576 -0.904128 -1.00442 -1.08598 -1.16486 -1.2511 -1.31353 -1.3839 -1.46637 -1.55127 -1.59776 -1.69598 -1.75169 -1.83682 -1.90696 -1.95607 -2.02681 -2.09963 -2.16938 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.150075 0.0195011 0.197847 0.34607 0.466678 0.595353 0.734856 0.869433 0.959796 1.05228 1.14527 1.231 1.27373 1.35586 1.39928 1.46083 1.50903 1.5411 1.58456 1.62744 1.66573 ];
ab2=442.054+[0.460929 0.199803 0.33718 0.549847 0.737957 0.925612 1.12146 1.27818 1.3762 1.47367 1.57166 1.66214 1.70384 1.77932 1.81705 1.86886 1.90894 1.93577 1.97077 2.00298 2.03165];
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

t=linspace(0,30.0681,10000);
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

% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - model 4 under axial rotation (6P)')
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

