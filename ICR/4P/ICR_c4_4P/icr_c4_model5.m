%% This code shows ICR for the C4 vertabrae for Model5_APSlide_NoTether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[0.83832 0.81661 0.802058 0.792073 0.754857 0.703017 0.565898 0.423274 0.32423 0.05339 -0.0783715 -0.409752 -0.566467 -0.75656 -1.04556 -1.34847 -1.75437 -1.93523 -2.2935 -2.53169 -2.83602 ];
aa3=-710.702+[-0.228187 -0.292057 -0.433613 -0.581527 -0.73129 -0.858894 -1.07675 -1.23128 -1.32803 -1.55815 -1.66471 -1.92105 -2.03959 -2.18187 -2.39681 -2.62379 -2.94335 -3.09093 -3.38866 -3.58975 -3.84957 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.04368 1.01053 0.959692 0.905336 0.820168 0.72546 0.511804 0.315733 0.182652 -0.169994 -0.34099 -0.769811 -0.973301 -1.2208 -1.59777 -1.99384 -2.53105 -2.7733 -3.2573 -3.58203 -4.00023 ];
ab3=-706.916+[-1.12587 -1.12845 -1.08521 -1.0222 -0.958924 -0.906906 -0.825245 -0.783854 -0.760783 -0.716667 -0.697852 -0.657584 -0.640414 -0.621424 -0.599487 -0.587758 -0.589245 -0.594654 -0.612686 -0.629397 -0.655758 ];

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

title('ICR of C4 vertabra - Model 5 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(2)
% cf=plot(point3,point4,'oy');
% hold on
cf=animatedline('color','y','marker','o');
for n=1:1:k-2
addpoints(cf,point3(n),point4(n));
drawnow
end
hold on
