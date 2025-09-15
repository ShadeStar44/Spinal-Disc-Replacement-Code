%% This code shows ICR for the C4 vertabrae for Model3_APSlide_Tether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[0.834194 0.811577 0.796316 0.784527 0.735899 0.668725 0.563522 0.423205 0.22484 0.124759 -0.129149 -0.409195 -0.666159 -0.86036 -1.12702 -1.48194 -1.70783 -2.01109 -2.34366 -2.68521 -2.92669 ];
aa3=-710.702+[-0.245598 -0.310415 -0.455864 -0.606556 -0.777336 -0.902879 -1.06058 -1.21577 -1.40194 -1.48741 -1.69055 -1.90669 -2.099 -2.24269 -2.43984 -2.70589 -2.88303 -3.12905 -3.40499 -3.69342 -3.89988 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.03537 1.00105 0.948205 0.891028 0.787891 0.678299 0.517932 0.324261 0.0608659 -0.0694272 -0.396948 -0.758697 -1.09112 -1.34337 -1.69051 -2.15424 -2.45251 -2.85726 -3.30574 -3.77112 -4.10303 ];
ab3=-706.916+[-1.12194 -1.12452 -1.08017 -1.01702 -0.94855 -0.899117 -0.841318 -0.799198 -0.757606 -0.741521 -0.707103 -0.674022 -0.647831 -0.630227 -0.612516 -0.602429 -0.604079 -0.613704 -0.632117 -0.658413 -0.681072 ];

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
figure (6)
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

title('ICR of C4 vertabra - Model 3 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')


figure(2)
% cd=plot(point3,point4,'oc');
% hold on
cd=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(cd,point3(n),point4(n));
drawnow
end
hold on
