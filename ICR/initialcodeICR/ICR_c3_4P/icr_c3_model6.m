%% This code shows ICR for the C3 vertabrae for Model6_LatSlide_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.13314 0.917845 0.157722 -1.24096 -2.19162 -3.18005 -3.99327 -4.81387 -5.87082 -6.25471 -6.89225 -7.42766 -7.87389 -8.41401 -8.97229 -9.3992 -9.88223 -10.3306 -10.8705 -11.1855 -11.5111 ];
aa3=-695.382+[0.676236 -1.4298 -1.76112 -2.3449 -2.77849 -3.28226 -3.74052 -4.24042 -4.93549 -5.20209 -5.6613 -6.06407 -6.41034 -6.84318 -7.30598 -7.67091 -8.09516 -8.50062 -9.00285 -9.30316 -9.62001 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.20359 0.888592 0.0579719 -1.47664 -2.5342 -3.65447 -4.5947 -5.56314 -6.84253 -7.31626 -8.1145 -8.79652 -9.37282 -10.0803 -10.8232 -11.3999 -12.062 -12.6866 -13.4507 -13.9033 -14.3772 ];
ab3=-693.523+[-0.143398 -1.29321 -1.14975 -0.999572 -0.955538 -0.947637 -0.968694 -1.01059 -1.09308 -1.13285 -1.21045 -1.28797 -1.36123 -1.46156 -1.57891 -1.67791 -1.79951 -1.92156 -2.08131 -2.18097 -2.28856 ];

% creating a displacement vector (node 27616,29008)from nth time increment to
% initial position.
for n=2:k
ua2(n-1)=[aa2(n)-aa2(1)];
ua3(n-1)=[aa3(n)-aa3(1)];
ub2(n-1)=[ab2(n)-ab2(1)];
ub3(n-1)=[ab3(n)-ab3(1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua3(n)/ua2(n);
    yb1(n)=ub3(n)/ub2(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];

t=linspace(0,30.0681,10000);
T=linspace(0,1,10000);

%% 0-2 Nm
figure (9)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab2(1)+.5*ub2(n)-aa2(1)-.5*ua2(n);ab3(1)+.5*ub3(n)-aa3(1)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(1)+.5*ua2(n)+t2*ya1(n);
ra3=aa3(1)+.5*ua3(n)-t2;


plot(ra2,ra3,'g')
hold on

j1=aa2(1)+T*ua2(n);
k1=aa3(1)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab2(1)+.5*ub2(n)+t*yb1(n);
rb3=ab3(1)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(1)+T*ub2(n);
k2=ab3(1)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20)
point4=point2(1,2:20)
plot(point3,point4,'ob');

title('ICR of C3 vertabra - model 6  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
cg=plot(point3,point4,'oy')

leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
hold on
title('ICR of C3 vertabra - model 6 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')