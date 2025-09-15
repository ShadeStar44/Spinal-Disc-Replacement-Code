%% This code shows ICR for the C3 vertabrae for Model1_SlideSlide_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.1371 1.78494 1.07202 0.384449 -0.503419 -1.19679 -2.21811 -2.93805 -3.90465 -4.31544 -5.09143 -5.72043 -6.44315 -7.05847 -7.64209 -8.23703 -8.82051 -9.38782 -9.93636 -10.3953 -10.7397 ];
aa3=-695.382+[-0.655181 -1.12885 -1.53582 -1.87755 -2.31048 -2.63376 -3.12049 -3.50005 -4.0519 -4.29861 -4.78336 -5.19563 -5.68939 -6.12639 -6.55537 -7.00856 -7.46944 -7.93368 -8.39886 -8.79961 -9.10802 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.18739 1.81099 1.02553 0.265313 -0.726256 -1.5018 -2.6572 -3.48614 -4.61833 -5.10657 -6.04033 -6.80903 -7.70653 -8.48271 -9.22981 -10.0027 -10.7725 -11.533 -12.2811 -12.9165 -13.3999 ];
ab3=-693.523+[-1.19053 -1.43143 -1.25579 -1.13455 -1.0179 -0.96538 -0.916755 -0.909846 -0.934115 -0.953769 -1.00715 -1.0665 -1.15079 -1.237 -1.33118 -1.44133 -1.56399 -1.69704 -1.8387 -1.96729 -2.06977 ];

% creating a displacement vector (node 27616,29008)from nth time increment to
% initial position.
for n=2:k
ua2(n-1)=[aa2(n)-aa2(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub2(n-1)=[ab2(n)-ab2(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
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
figure (3)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab2(n)+.5*ub2(n)-aa2(n)-.5*ua2(n);ab3(n)+.5*ub3(n)-aa3(n)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(n)+.5*ua2(n)+t2*ya1(n);
ra3=aa3(n)+.5*ua3(n)-t2;


plot(ra2,ra3,'g')
hold on

j1=aa2(n)+T*ua2(n);
k1=aa3(n)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab2(n)+.5*ub2(n)+t*yb1(n);
rb3=ab3(n)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(n)+T*ub2(n);
k2=ab3(n)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

title('ICR of C3 vertabra - model 1  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cb=plot(point3,point4,'or');
% hold on
cb=animatedline('color','r','marker','o');
for n=1:1:k-2
addpoints(cb,point3(n),point4(n));
drawnow
end
hold on