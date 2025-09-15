%% This code shows ICR for the C3 vertabrae for Model13_Fixed_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[0.522334 0.580475 0.729488 0.893676 1.08905 1.24927 1.50254 1.73973 2.04039 2.32071 2.62282 2.88114 3.21069 3.46418 3.95581 4.14692 4.48927 4.69297 5.02232 5.25755 5.48821 ];
aa2=442.794+[2.74031 2.74552 2.83339 2.93891 3.06169 3.16055 3.30786 3.43473 3.57682 3.69109 3.7958 3.87868 3.97272 4.03652 4.14906 4.19098 4.26444 4.30742 4.37679 4.42683 4.47634 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[0.562722 0.631271 0.812649 1.01769 1.26861 1.48058 1.82363 2.1509 2.57015 2.96213 3.38284 3.74454 4.20618 4.56103 5.25335 5.52505 6.01592 6.31072 6.79186 7.13959 7.48439];
ab2=442.825+[2.28105 2.17109 1.95727 1.74637 1.50466 1.30914 1.00875 0.741132 0.424649 0.156734 -0.104271 -0.314897 -0.566204 -0.749383 -1.09177 -1.22237 -1.45431 -1.59158 -1.81253 -1.97022 -2.12515 ];
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
figure (9)
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

title('ICR of C3 vertabrae - model 13 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ch=plot(point3,point4,'*r');
% hold on

ch=animatedline('color','r','marker','*');
for n=1:1:k-2
addpoints(ch,point3(n),point4(n));
drawnow
end

