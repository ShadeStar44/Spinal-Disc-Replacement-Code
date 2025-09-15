%% This code shows ICR for the C3 vertabrae for Model4_APSlide_NoTether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[-0.34031 1.80068 2.88881 3.96026 4.66734 5.74038 6.52247 7.33192 8.02579 8.7524 9.32716 9.63119 10.0029 10.3757 10.6751 11.0628 11.2567 11.5741 11.8712 12.1135 12.3625 ];
%aa2=441.954+[];
aa3=-690.645+[0.204163 -0.844802 -0.676264 -0.520326 -0.421364 -0.29055 -0.216886 -0.163942 -0.136374 -0.115836 -0.0978655 -0.0850856 -0.0629994 -0.0437847 -0.0302991 -0.0153966 -0.00957816 -0.00334833 -0.00147386 -0.0033984 -0.00885947 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[-0.331953 1.63302 2.58273 3.49206 4.07919 4.95508 5.58341 6.22153 6.75779 7.30402 7.71938 7.93182 8.18833 8.44246 8.64462 8.90246 9.02989 9.23838 9.43246 9.58908 9.74871 ];
%ab2=441.501+[];
ab3=-692.656+[0.239125 -1.93807 -2.33088 -2.71625 -2.97427 -3.3779 -3.68989 -4.04006 -4.36354 -4.72838 -5.03328 -5.19877 -5.39653 -5.59612 -5.7578 -5.97169 -6.08136 -6.26163 -6.43227 -6.57513 -6.72534 ];


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
figure (6)
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

title('ICR of C3 vertabra - model 4 under under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ce=plot(point3,point4,'oc');
% hold on
ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')