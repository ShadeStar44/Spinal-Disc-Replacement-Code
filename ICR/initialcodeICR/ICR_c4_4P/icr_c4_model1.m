%% This code shows ICR for the C4 vertabrae inferior endplate for Model1_SlideSlide_Tether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[1.04045 0.805909 0.540218 0.206958 -0.26069 -0.667458 -1.27963 -1.70294 -2.26632 -2.5043 -2.95367 -3.3181 -3.73702 -4.09447 -4.43463 -4.78149 -5.12174 -5.45234 -5.771 -6.03787 -6.23769 ];
aa3=-710.702+[-0.0504818 -0.399583 -0.717093 -0.97369 -1.2937 -1.5323 -1.89615 -2.18104 -2.59284 -2.77543 -3.13157 -3.43109 -3.78613 -4.09858 -4.40404 -4.72555 -5.0514 -5.37839 -5.70381 -5.98385 -6.19882 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.2271 0.968236 0.607016 0.190608 -0.386955 -0.875385 -1.61584 -2.13949 -2.85035 -3.1556 -3.73927 -4.21994 -4.78122 -5.26779 -5.73751 -6.22377 -6.70838 -7.18731 -7.65749 -8.0579 -8.3624 ];
ab3=-706.916+[-0.86887 -1.08632 -0.956676 -0.870043 -0.782369 -0.743734 -0.705649 -0.700006 -0.715491 -0.727588 -0.759847 -0.794684 -0.842471 -0.890445 -0.942633 -1.00371 -1.07172 -1.14511 -1.22225 -1.2917 -1.3466 ];

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

title('ICR of C4 vertabra - Model 1 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')


figure(2)
cb=plot(point3,point4,'or')

title('ICR of C4 vertabra - Model 1 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

