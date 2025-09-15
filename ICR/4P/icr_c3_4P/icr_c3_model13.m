%% This code shows ICR for the C3 vertabrae for Model13_Fixed_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.23255 2.17735 2.03999 1.88842 1.70733 1.50516 1.28238 1.04018 0.780204 0.507515 0.220553 -0.0820377 -0.455333 -0.737562 -0.999119 -1.35516 -1.7128 -2.13397 -2.54655 -3.00024 -3.27995 ];
aa3=-695.382+[-0.240465 -0.337094 -0.509446 -0.670775 -0.84983 -1.03222 -1.21739 -1.40966 -1.61124 -1.81777 -2.02672 -2.238 -2.49235 -2.67787 -2.84825 -3.07676 -3.30238 -3.56916 -3.83176 -4.12193 -4.30184 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.30013 2.23844 2.08425 1.9121 1.70336 1.46947 1.21056 0.926739 0.619523 0.296139 -0.0447938 -0.405175 -0.852774 -1.19228 -1.50878 -1.9417 -2.37874 -2.89729 -3.40852 -3.97439 -4.32524 ];
ab3=-693.523+[-1.10706 -1.10776 -1.06398 -1.00188 -0.923652 -0.84961 -0.776533 -0.705449 -0.63853 -0.582897 -0.535599 -0.493306 -0.446863 -0.41642 -0.390474 -0.359595 -0.333169 -0.309187 -0.294457 -0.287377 -0.287449 ];

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
figure (10)
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

title('ICR of C3 vertabra - model 13  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ch=plot(point3,point4,'*r');
% hold on
ch=animatedline('color','r','marker','*');
for n=1:1:k-2
addpoints(ch,point3(n),point4(n));
drawnow
end
hold on