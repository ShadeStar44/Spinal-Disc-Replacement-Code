%% This code shows ICR for the C4 vertabrae for Model2_SlideSlide_NoTether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[1.21669 1.14246 1.06522 0.995204 0.857291 0.721443 0.523135 0.282899 -0.0360725 -0.292679 -0.676113 -0.972151 -1.1961 -1.5586 -1.9604 -2.31259 -2.73644 -2.98472 -3.37529 -3.76839 -4.01575 ];
aa3=-710.702+[-0.0313438 -0.207655 -0.402356 -0.582877 -0.781302 -0.931431 -1.11605 -1.30168 -1.53088 -1.70523 -1.964 -2.16189 -2.31331 -2.56931 -2.87775 -3.15825 -3.50404 -3.71011 -4.04041 -4.381 -4.59928 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.43862 1.35044 1.22841 1.10525 0.904747 0.718047 0.456478 0.153011 -0.245977 -0.565681 -1.04685 -1.41976 -1.70354 -2.16689 -2.6899 -3.1544 -3.72036 -4.05533 -4.58774 -5.13041 -5.47545 ];
ab3=-706.916+[-1.03469 -1.13114 -1.09018 -1.01538 -0.93736 -0.879188 -0.820178 -0.777067 -0.734701 -0.70684 -0.669913 -0.648124 -0.635516 -0.627352 -0.636137 -0.65397 -0.68519 -0.708033 -0.751137 -0.804047 -0.842025  ];

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
figure (5)
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

title('ICR of C4 vertabra - Model 2 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(2)
% cc=plot(point3,point4,'og');
% hold on
cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end
hold on

