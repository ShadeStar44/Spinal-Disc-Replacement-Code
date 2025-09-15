%% This code shows ICR for the C3 vertabrae for Model11_SlideSlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[-0.230154 0.157825 0.662198 1.28338 1.82389 2.45373 3.08407 3.73449 4.09102 4.63071 5.02525 5.2517 5.53915 5.80818 6.05019 6.28897 6.42359 6.65815 6.80507 6.90349 7.01894 ];
aa2=442.794+[2.43137 2.39336 2.44189 2.52562 2.59077 2.63987 2.67521 2.70786 2.73867 2.82483 2.9153 2.97724 3.06595 3.15839 3.24843 3.34014 3.39224 3.48187 3.53455 3.5685 3.60509 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[-0.226164 0.199341 0.77342 1.50975 2.17068 2.95132 3.74438 4.57396 5.0376 5.7573 6.29887 6.61677 7.02911 7.42599 7.7943 8.16934 8.38636 8.77621 9.02828 9.19979 9.40518 ];
ab2=442.825+[2.1935 1.78091 1.30439 0.717297 0.209786 -0.340886 -0.854232 -1.33337 -1.58138 -1.9294 -2.17029 -2.30565 -2.47674 -2.64111 -2.79701 -2.96481 -3.06717 -3.26339 -3.40107 -3.49721 -3.61911 ];
% ab3=-689.315+[];

for n=2:k
ua1(n-1)=[aa1(n)-aa1(n-1)];
ua2(n-1)=[aa2(n)-aa2(n-1)];
ub1(n-1)=[ab1(n)-ab1(n-1)];
ub2(n-1)=[ab2(n)-ab2(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua2(n)/ua1(n);
    yb1(n)=ub2(n)/ub1(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];


T=linspace(0,1,10000);

%% 0-2 Nm
figure (3)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab1(n)+.5*ub1(n)-aa1(n)-.5*ua1(n);ab2(n)+.5*ub2(n)-aa2(n)-.5*ua2(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra1=aa1(n)+.5*ua1(n)+t2*ya1(n);
ra3=aa2(n)+.5*ua2(n)-t2;


plot(ra1,ra3,'g')
hold on

j1=aa1(n)+T*ua1(n);
k1=aa2(n)+T*ua2(n);
plot(j1,k1,'c')
hold on

rb2=ab1(n)+.5*ub1(n)+t*yb1(n);
rb3=ab2(n)+.5*ub2(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab1(n)+T*ub1(n);
k2=ab2(n)+T*ub2(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

hold on
plot(ab1,ab2,'ok')
hold on 
plot(aa1,aa2,'ok')

title('ICR of C3 vertabrae - model 1 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cb=plot(point3,point4,'or');
% hold on

cb=animatedline('color','r','marker','o');
for n=1:1:k-2
addpoints(cb,point3(n),point4(n));
drawnow
end

