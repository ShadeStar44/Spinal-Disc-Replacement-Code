%% This code shows ICR for the C5 vertabrae for Model5_LatSlide_Tether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[0.21115 0.228517 0.313347 0.409154 0.510336 0.605509 0.728682 0.74505 0.745291 0.710791 0.689056 0.621512 0.586311 0.541678 0.465783 0.376704 0.253508 0.198956 0.0904843 0.0174588 -0.0774922 ];
aa3=-728.01+[-0.580586 -0.615271 -0.648225 -0.665819 -0.713281 -0.781987 -0.91316 -0.997784 -1.0531 -1.19564 -1.26295 -1.42628 -1.50154 -1.59203 -1.72827 -1.8726 -2.07554 -2.16923 -2.35864 -2.48618 -2.65006 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[0.253164 0.269671 0.354216 0.450295 0.546825 0.633048 0.73704 0.741828 0.734164 0.678145 0.6454 0.549057 0.49949 0.43667 0.332354 0.212577 0.0455789 -0.0298586 -0.182292 -0.286287 -0.42269 ];
ab3=-726.226+[-0.945216 -0.969119 -0.99813 -1.01846 -1.01517 -0.991519 -0.942116 -0.925999 -0.915644 -0.890469 -0.877152 -0.842939 -0.825815 -0.804354 -0.775401 -0.752573 -0.733296 -0.726676 -0.715055 -0.708176 -0.700178 ];

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

title('ICR of C5 vertabra - model 5  under flexion (4P)')
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