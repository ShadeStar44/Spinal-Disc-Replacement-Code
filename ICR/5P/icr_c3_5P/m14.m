%% This code shows ICR for the C3 vertabrae for Model14_Fixed_NoTether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[-0.203706 0.506713 1.77898 2.37534 3.40773 4.31929 4.98379 5.72774 6.53016 7.29036 7.9064 8.7747 9.23981 9.95782 10.367 10.8317 11.1494 11.4803 11.7927 12.0585 12.2679 ];
%aa2=441.954+[];
aa3=-690.645+[-0.37895 -0.497624 -0.220642 -0.119782 0.019734 0.115547 0.175087 0.235103 0.290154 0.329903 0.349626 0.357004 0.353031 0.33754 0.327442 0.319919 0.31285 0.30425 0.294334 0.28432 0.274243 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[-0.200774 0.450254 1.58458 2.10349 2.98624 3.75044 4.29844 4.90185 5.54176 6.13797 6.6144 7.27509 7.62427 8.15437 8.44717 8.77277 8.98909 9.20814 9.41013 9.58059 9.71477];
%ab2=441.501+[];
ab3=-692.656+[-0.3916 -0.982217 -1.45846 -1.68215 -2.07164 -2.42138 -2.68106 -2.97889 -3.30968 -3.63624 -3.91585 -4.33241 -4.56695 -4.94733 -5.17707 -5.44697 -5.63997 -5.84754 -6.04731 -6.21694 -6.35095 ];

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
figure (10)
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

title('ICR of C3 vertabra - model 14 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ci=plot(point3,point4,'*g');
% hold on

ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','*')

xlabel('x-coords (mm)')
ylabel('z-coords (mm)')
title('ICR of C3 vertabra under lateral bending (5P)')
leg=[ca,ce,ci]
legend(leg,'intact','model 4','model 14','location','northeast')
