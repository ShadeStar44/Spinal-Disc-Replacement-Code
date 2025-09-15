%% This code shows ICR for the C3 vertabrae for Model2_SlideSlide_NoTether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[-0.0675969 0.105246 0.508063 0.996591 1.27057 1.79105 2.67675 2.95702 3.53452 4.37792 4.90092 5.46171 6.21153 6.88963 7.569 8.23565 8.82007 9.41037 9.92549 10.4531 10.9721 ];
%aa2=441.954+[];
aa3=-690.645+[-1.04167 -1.08337 -0.937603 -0.768938 -0.683356 -0.544208 -0.359908 -0.311777 -0.225934 -0.124385 -0.0717569 -0.0235721 0.0279447 0.063432 0.0906266 0.109346 0.120329 0.126244 0.131708 0.138326 0.144869 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[-0.0727952 0.0766534 0.424095 0.838394 1.06757 1.49987 2.22872 2.45779 2.92783 3.60975 4.0281 4.47272 5.06085 5.58674 6.10894 6.61682 7.05756 7.49892 7.88178 8.27157 8.65159 ];
%ab2=441.501+[];
ab3=-692.656+[-1.1268 -1.36327 -1.59999 -1.83838 -1.96286 -2.18628 -2.54201 -2.6503 -2.86991 -3.1831 -3.37726 -3.58732 -3.87305 -4.13604 -4.40302 -4.67227 -4.91496 -5.16419 -5.38241 -5.60674 -5.83049 ];


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
figure (4)
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

title('ICR of C3 vertabra - model 2 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cc=plot(point3,point4,'og');
% hold on
cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end
