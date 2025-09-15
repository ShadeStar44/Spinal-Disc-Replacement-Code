%% This code shows ICR for the C3 vertabrae for Model3_APSlide_Tether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[0.508695 0.565007 0.735337 0.961145 1.08063 1.3885 1.64985 1.95793 2.35062 2.69884 3.17722 3.51634 3.91307 4.37485 4.81614 5.35897 5.80415 6.31098 6.98316 7.21648 7.70175 ];
%aa2=441.954+[];
aa3=-690.645+[-1.08509 -1.05067 -0.950385 -0.836091 -0.780923 -0.653348 -0.558469 -0.459601 -0.350098 -0.266399 -0.168695 -0.108571 -0.0448463 0.0205271 0.0746414 0.130908 0.170663 0.208534 0.246981 0.257557 0.274755 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[0.472259 0.514954 0.651047 0.832551 0.928173 1.17318 1.37967 1.62084 1.92634 2.19679 2.56794 2.83123 3.13783 3.49308 3.8316 4.24635 4.58477 4.96888 5.47601 5.65128 6.01475 ];
%ab2=441.501+[];
ab3=-692.656+[-1.42601 -1.48979 -1.615 -1.75643 -1.82611 -1.99511 -2.1299 -2.28373 -2.47057 -2.62771 -2.83465 -2.9746 -3.13517 -3.31941 -3.49256 -3.70378 -3.87597 -4.07178 -4.33337 -4.42484 -4.61683 ];


for n=2:k
ua1(n-1)=[aa1(n)-aa1(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub1(n-1)=[ab1(n)-ab1(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
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
figure (5)
for n=2:k-1
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

title('ICR of C3 vertabra - model 3 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cd=plot(point3,point4,'ob');
% hold on
cd=animatedline('color','b','marker','o');
for n=1:1:k-2
addpoints(cd,point3(n),point4(n));
drawnow
end