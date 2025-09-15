%% This code shows ICR for the C3 vertabrae for Model15_Intact/TLC_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[0.821476 1.42974 1.89157 2.35749 2.83222 3.19544 3.60983 3.97719 4.26823 4.53245 4.79066 5.0092 5.19286 5.37557 5.5577 5.7049 5.83355 5.97774 6.10261 6.20122 6.3011 ];
aa2=442.794+[0.175475 0.665773 1.05186 1.38134 1.75802 2.06151 2.37301 2.63486 2.82927 2.99518 3.16031 3.30202 3.40903 3.50158 3.58388 3.64457 3.69269 3.73986 3.77764 3.8067 3.83137 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[0.869657 1.55856 2.10519 2.67412 3.26792 3.73492 4.27347 4.75648 5.14849 5.51371 5.88217 6.20209 6.47652 6.75768 7.04829 7.28874 7.50182 7.74554 7.96079 8.13673 8.31919 ];
ab2=442.825+[-0.337968 -0.503922 -0.639822 -0.833401 -0.955737 -1.03078 -1.11605 -1.17761 -1.25002 -1.34055 -1.44317 -1.53766 -1.63494 -1.75951 -1.91234 -2.04962 -2.17755 -2.33435 -2.47942 -2.6047 -2.74309 ];
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
figure (2)
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

title('ICR of C3 vertabrae - Intact model under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ca=plot(point3,point4,'ok');
% hold on

ca=animatedline('color','k','marker','o');
for n=1:1:k-2
addpoints(ca,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')

