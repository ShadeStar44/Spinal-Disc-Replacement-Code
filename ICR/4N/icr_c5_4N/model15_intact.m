%% This code shows ICR for the C5 vertabrae for Model15_Intact/TLC_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.0426379 -0.0757545 -0.0845906 0.0060263 0.180537 0.4264 0.732903 1.07275 1.43613 1.83854 2.2551 2.70914 3.17524 3.6604 4.07669 4.49005 4.84884 5.15352 5.43123 5.65186 5.86669];
aa3=-728.01+[-0.26043 -0.295993 -0.233165 -0.104378 0.0770283 0.298211 0.546033 0.7963 1.04059 1.28613 1.51353 1.73074 1.92708 2.11288 2.26453 2.40784 2.53617 2.6514 2.75739 2.84356 2.92923 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.0901372 -0.0308943 -0.0327768 0.0709056 0.261011 0.521296 0.837981 1.18044 1.53768 1.92407 2.3155 2.73382 3.15471 3.58347 3.94164 4.28759 4.57645 4.81254 5.02249 5.18481 5.33974  ];
ab3=-726.226+[-0.682486 -0.685294 -0.700613 -0.734214 -0.784086 -0.849115 -0.941246 -1.05493 -1.18279 -1.32749 -1.48152 -1.65712 -1.84917 -2.05957 -2.25563 -2.46553 -2.66376 -2.83985 -2.99941 -3.1274 -3.24991 ];

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
figure (2)
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

title('ICR of C5 vertabra - Intact model  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ca=plot(point3,point4,'ok');
% hold on

ca=animatedline('color','k','marker','o');
for n=1:1:k-2
addpoints(ca,point3(n),point4(n));
drawnow
end