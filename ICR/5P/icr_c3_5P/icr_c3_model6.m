%% This code shows ICR for the C3 vertabrae for Model6_LatSlide_NoTether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[-0.340266 1.00722 1.89754 2.97662 3.76708 4.706 5.50165 6.30487 7.11502 7.85684 8.64711 9.28903 9.77375 10.2559 10.5682 10.966 11.2038 11.5183 11.7923 12.0712 12.3333];
%aa2=441.954+[];
aa3=-690.645+[0.202674 -0.911395 -0.729891 -0.563708 -0.46472 -0.359229 -0.277373 -0.202826 -0.140065 -0.0965176 -0.0671513 -0.0522313 -0.0390253 -0.0205413 -0.00996646 0.00280857 0.00998582 0.0161841 0.018329 0.0174151 0.0136675 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[-0.331911 0.895475 1.68183 2.61316 3.2826 4.06183 4.71043 5.35523 5.99447 6.56904 7.1696 7.64937 8.00023 8.3435 8.56174 8.83284 8.99116 9.19844 9.37847 9.56022 9.72932 ];
%ab2=441.501+[];
ab3=-692.656+[0.237608 -1.72777 -2.04403 -2.43263 -2.71821 -3.06437 -3.36083 -3.66626 -3.99173 -4.31069 -4.67527 -4.98799 -5.23694 -5.48843 -5.65503 -5.87255 -6.00632 -6.18587 -6.34306 -6.50528 -6.6613 ];


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
figure (8)
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

title('ICR of C3 vertabra - model 6 lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cg=plot(point3,point4,'oy');
% hold on

cg=animatedline('color','y','marker','o');
for n=1:1:k-2
addpoints(cg,point3(n),point4(n));
drawnow
end
