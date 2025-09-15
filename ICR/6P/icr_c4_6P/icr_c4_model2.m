%% This code shows ICR for the C4 vertabrae for Model2_Slideslide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[-0.161929 -0.0877849 0.0738386 0.200781 0.441117 0.688014 1.01238 1.31637 1.71061 2.0593 2.4793 2.90407 3.28029 3.71581 3.97414 4.4387 4.6278 4.94947 5.16712 5.40716 5.6135 ];
aa2=441.02+[1.40842 1.22787 0.935668 0.742735 0.428197 0.156707 -0.143443 -0.39146 -0.68648 -0.932325 -1.21778 -1.49951 -1.74204 -2.01553 -2.17536 -2.46162 -2.57817 -2.77801 -2.91636 -3.07246 -3.20915 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[-0.174836 -0.112106 0.014549 0.110112 0.284934 0.461527 0.697377 0.923066 1.22003 1.4837 1.80055 2.11858 2.39688 2.7141 2.89938 3.22621 3.35694 3.57587 3.72074 3.87703 4.00838 ];
ab2=441.349+[1.63256 1.60327 1.68498 1.76678 1.93329 2.09497 2.26287 2.37781 2.4751 2.53663 2.59101 2.63059 2.66403 2.70601 2.73283 2.78475 2.8069 2.84561 2.87281 2.90405 2.93185 ];
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
figure (4)
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

title('ICR of C4 vertabrae - model 2 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cc=plot(point3,point4,'og');
% hold on

cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end


