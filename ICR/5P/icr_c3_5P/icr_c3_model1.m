%% This code shows ICR for the C3 vertabrae for Model1_SlideSlide_Tether_5P (lateral beding to left)
% right hand side node: 8826
k=21;
%original coords
aa1=-7.90293+[-0.215677 0.230109 0.86275 1.63126 2.4577 3.4943 4.25827 4.98772 5.76325 6.54429 7.31712 7.98927 8.67912 9.44617 9.95077 10.435 10.9192 11.2763 11.6357 11.9286 12.2149 ];
%aa2=441.954+[];
aa3=-690.645+[-0.938672 -1.06598 -0.886236 -0.695588 -0.538961 -0.393775 -0.308708 -0.239848 -0.177422 -0.123103 -0.0765249 -0.0445335 -0.0174177 0.00432752 0.0158673 0.0323943 0.0528039 0.0672036 0.0778624 0.0817022 0.0816284 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[-0.214171 0.187483 0.747665 1.41435 2.12011 2.99193 3.62568 4.22385 4.85054 5.47158 6.07561 6.59236 7.11549 7.6899 8.06175 8.41473 8.76084 9.00926 9.25512 9.45225 9.64072 ];
%ab2=441.501+[];
ab3=-692.656+[-0.96517 -1.45235 -1.72417 -2.02183 -2.32979 -2.71245 -2.99124 -3.25644 -3.54507 -3.84324 -4.14891 -4.42877 -4.72497 -5.06861 -5.30347 -5.53054 -5.76534 -5.94975 -6.14514 -6.3109 -6.47954 ];

for n=2:k
ua1(n-1)=[aa1(n)-aa1(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub1(n-1)=[ab1(n)-ab1(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=2:k-1
    ya1(n)=ua3(n)/ua1(n);
    yb1(n)=ub3(n)/ub1(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];

t=linspace(0,30.0681,10000);
T=linspace(0,1,10000);

%% 0-2 Nm
figure (3)
for n=1:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab1(n)+.5*ub1(n)-aa1(n)-.5*ua1(n);ab3(n)+.5*ub3(n)-aa3(n)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra1=aa1(n)+.5*ua1(n)+t2*ya1(n);
ra3=aa3(n)+.5*ua3(n)-t2;


plot(ra1,ra3,'g')
hold on

j1=aa1(n)+T*ua1(n);
k1=aa3(n)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab1(n)+.5*ub1(n)+t*yb1(n);
rb3=ab3(n)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab1(n)+T*ub1(n);
k2=ab3(n)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

% hold on
% plot(ab1,ab3,'ok')
% hold on 
% plot(aa1,aa3,'ok')

title('ICR of C3 vertabra - model 1 under lateral bending (5P) ')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cb=plot(point3,point4,'or');
% hold on
cb=animatedline('color','r','marker','o');
for n=1:1:k-2
addpoints(cb,point3(n),point4(n));
drawnow
end