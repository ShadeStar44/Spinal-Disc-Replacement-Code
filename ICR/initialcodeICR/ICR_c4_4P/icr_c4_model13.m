%% This code shows ICR for the C4 vertabrae for Model13_Fixed_Tether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[0.957415 0.946335 0.948456 0.9555 0.963198 0.945472 0.90758 0.852455 0.780789 0.687318 0.57295 0.440366 0.267852 0.130174 -1.62104E-005 -0.183056 -0.372482 -0.600409 -0.82877 -1.0844 -1.24405 ];
aa3=-710.702+[0.189123 0.150801 0.056048 -0.0472003 -0.168207 -0.28217 -0.398132 -0.520524 -0.647916 -0.773788 -0.901062 -1.03196 -1.19187 -1.31093 -1.42107 -1.57031 -1.71979 -1.8987 -2.07646 -2.2749 -2.39896 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.18884 1.17144 1.15137 1.13042 1.10229 1.04956 0.973918 0.877726 0.762136 0.625571 0.467272 0.288473 0.0574799 -0.125027 -0.297787 -0.539843 -0.789924 -1.09162 -1.39417 -1.73374 -1.94647 ];
ab3=-706.916+[-0.852817 -0.855273 -0.828727 -0.786328 -0.731105 -0.682286 -0.63157 -0.581199 -0.532716 -0.493998 -0.46058 -0.429289 -0.392865 -0.367432 -0.344727 -0.316205 -0.290022 -0.263972 -0.244208 -0.228462 -0.221698 ];

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
figure (10)
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

title('ICR of C4 vertabra - Model 13 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(2)
ch=plot(point3,point4,'*g')
hold on
title('ICR of C4 vertabra - Model 13 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
