%% This code shows ICR for the C4 vertabrae for Model4_APSlide_NoTether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[0.922568 -0.404431 -1.28639 -2.0261 -2.4015 -2.87697 -3.21005 -3.53854 -3.89281 -4.21917 -4.51997 -4.8839 -5.12378 -5.35196 -5.63903 -5.85383 -6.11689 -6.36519 -6.59591 -6.7647 -6.96844 ];
aa3=-710.702+[0.993281 -0.995962 -1.52064 -2.01817 -2.30101 -2.6836 -2.96371 -3.24897 -3.56737 -3.86724 -4.15136 -4.50858 -4.75044 -4.98509 -5.28909 -5.52194 -5.81302 -6.09414 -6.36182 -6.56158 -6.80862 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.12965 -0.424105 -1.48025 -2.38454 -2.85574 -3.46516 -3.90023 -4.33613 -4.8138 -5.25981 -5.67703 -6.19229 -6.53691 -6.86839 -7.29242 -7.61448 -8.01457 -8.39836 -8.76106 -9.0304 -9.36151 ];
ab3=-706.916+[0.0694568 -0.875899 -0.77691 -0.762607 -0.772561 -0.798243 -0.823024 -0.85261 -0.891877 -0.934349 -0.97905 -1.0393 -1.08432 -1.13123 -1.19546 -1.24709 -1.31448 -1.38236 -1.44939 -1.50063 -1.56466 ];

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

title('ICR of C4 vertabra - Model 4 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(2)
% ce=plot(point3,point4,'om');
% hold on
ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end
hold on

plot(point3(1),point4(1),'color','r','marker','o')
