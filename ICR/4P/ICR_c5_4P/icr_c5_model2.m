%% This code shows ICR for the C5 vertabrae for Model2_SlideSlide_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.41564 0.41967 0.49115 0.574593 0.667728 0.724121 0.746064 0.706096 0.631689 0.562432 0.453725 0.363313 0.291829 0.171264 0.0409305 -0.0734815 -0.211862 -0.293414 -0.422713 -0.553814 -0.637095 ];
aa3=-728.01+[-0.30157 -0.465035 -0.535162 -0.57666 -0.686751 -0.787548 -0.906003 -1.02151 -1.17147 -1.2893 -1.46246 -1.59466 -1.69458 -1.86229 -2.06366 -2.24629 -2.47025 -2.60294 -2.81403 -3.03013 -3.1676 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.471921 0.472401 0.542252 0.623652 0.704622 0.747398 0.752705 0.696676 0.599732 0.510907 0.370612 0.254198 0.162264 0.00722016 -0.16492 -0.319063 -0.509182 -0.623039 -0.806093 -0.995092 -1.11673 ];
ab3=-726.226+[-0.858206 -0.970355 -1.01552 -1.03024 -1.00058 -0.962435 -0.925409 -0.903055 -0.875678 -0.851544 -0.813579 -0.785391 -0.76625 -0.745116 -0.733828 -0.727698 -0.721743 -0.718596 -0.714841 -0.713028 -0.712745 ];

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

title('ICR of C5 vertabra - model 2  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cc=plot(point3,point4,'og');
% hold on


cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end