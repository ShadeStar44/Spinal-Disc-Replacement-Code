%% This code shows ICR for the C3 vertabrae for Model5_LatSlide_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.06711 1.97601 1.76057 1.52962 1.26267 1.01487 0.557724 0.20247 -0.0247199 -0.578726 -0.837127 -1.46175 -1.75031 -2.09533 -2.60964 -3.1373 -3.84057 -4.15357 -4.7711 -5.17895 -5.69715 ];
aa3=-695.382+[-0.926547 -1.0615 -1.29228 -1.50856 -1.73845 -1.9409 -2.27892 -2.52431 -2.67819 -3.03447 -3.1967 -3.5793 -3.75513 -3.9646 -4.27762 -4.60322 -5.05328 -5.25964 -5.67487 -5.95411 -6.31469 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.11418 2.01117 1.76548 1.49775 1.18578 0.893704 0.354055 -0.0650805 -0.334461 -0.990974 -1.29903 -2.04748 -2.39621 -2.81533 -3.44399 -4.09321 -4.9678 -5.3612 -6.1442 -6.66608 -7.33497 ];
ab3=-693.523+[-1.52447 -1.5235 -1.45566 -1.36657 -1.27551 -1.20071 -1.08852 -1.0282 -0.995173 -0.935259 -0.911677 -0.866221 -0.849209 -0.832387 -0.816896 -0.816028 -0.838756 -0.856072 -0.902092 -0.940671 -0.998445 ];

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
figure (8)
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

title('ICR of C3 vertabra - model 5  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cf=plot(point3,point4,'om');
% hold on
cf=animatedline('color','m','marker','o');
for n=1:1:k-2
addpoints(cf,point3(n),point4(n));
drawnow
end
hold on