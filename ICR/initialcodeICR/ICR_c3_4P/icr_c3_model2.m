%% This code shows ICR for the C3 vertabrae for Model2_SlideSlide_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.50878 2.35272 2.02929 1.69576 1.26174 0.907707 0.454215 -0.0267533 -0.624659 -1.08328 -1.75755 -2.26661 -2.64883 -3.26605 -3.95547 -4.55725 -5.27705 -5.69712 -6.35501 -7.01419 -7.42699 ];
aa3=-695.382+[-0.68346 -0.952658 -1.23821 -1.48874 -1.78881 -2.0113 -2.28467 -2.56323 -2.90346 -3.15651 -3.52717 -3.80699 -4.021 -4.37971 -4.80785 -5.19534 -5.67185 -5.95629 -6.41212 -6.88296 -7.18488 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.57258 2.40255 2.04394 1.66723 1.17275 0.768019 0.246984 -0.306619 -0.999363 -1.53328 -2.32552 -2.92828 -3.38436 -4.12711 -4.96892 -5.71282 -6.61354 -7.14491 -7.98572 -8.83934 -9.37973 ];
ab3=-693.523+[-1.40636 -1.50989 -1.44094 -1.33517 -1.22201 -1.14336 -1.06251 -1.00162 -0.944679 -0.910649 -0.870335 -0.850607 -0.841926 -0.844525 -0.871989 -0.912192 -0.977443 -1.02369 -1.10898 -1.21091 -1.28306 ];

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
figure (4)
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

title('ICR of C3 vertabra - model 2  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
cc=plot(point3,point4,'og')

leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
hold on
title('ICR of C3 vertabra - model 2 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')