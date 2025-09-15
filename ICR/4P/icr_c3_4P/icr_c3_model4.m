%% This code shows ICR for the C3 vertabrae for Model4_APSlide_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.13302 -0.174824 -1.69285 -2.98023 -3.65029 -4.50839 -5.11265 -5.70851 -6.35055 -6.93869 -7.47918 -8.13483 -8.56491 -8.97206 -9.48526 -9.86906 -10.3385 -10.7819 -11.1932 -11.4946 -11.8605 ];
aa3=-695.382+[0.678064 -1.73872 -2.33436 -2.95851 -3.3392 -3.86731 -4.26064 -4.66342 -5.11728 -5.54747 -5.95696 -6.4772 -6.82986 -7.17214 -7.61756 -7.95986 -8.38839 -8.80426 -9.20008 -9.49561 -9.86142 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.20351 -0.270796 -1.92376 -3.3615 -4.12996 -5.1342 -5.85479 -6.57615 -7.36647 -8.10153 -8.78752 -9.63676 -10.2023 -10.7442 -11.4379 -11.9644 -12.6173 -13.2439 -13.834 -14.2717 -14.8105 ];
ab3=-693.523+[-0.142149 -1.16506 -1.01937 -0.979243 -0.98487 -1.01547 -1.051 -1.0973 -1.16202 -1.23457 -1.31284 -1.42251 -1.50498 -1.59085 -1.70947 -1.80581 -1.93255 -2.06169 -2.19042 -2.28977 -2.41581 ];

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
figure (7)
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

title('ICR of C3 vertabra - model 4  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

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