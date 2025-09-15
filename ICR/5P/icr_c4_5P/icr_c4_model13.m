%% This code shows ICR for the C4 vertabrae for Model13_Fixed_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[0.205896 0.219676 0.261533 0.321908 0.417195 0.470297 0.637339 0.749872 0.913408 1.11964 1.3346 1.59248 1.83505 2.19165 2.39921 2.78064 3.03377 3.35879 3.65754 4.1117 4.26974 ];
%aa2=441.284+[];
aa3=-708.334+[-0.293836 -0.282247 -0.215101 -0.139963 -0.0415188 0.00378526 0.118024 0.181201 0.256939 0.338623 0.412316 0.490573 0.557113 0.644976 0.692054 0.772796 0.823359 0.884525 0.937474 1.01371 1.03945 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[0.194831 0.206505 0.240316 0.289484 0.365937 0.408436 0.542641 0.632917 0.765242 0.932131 1.1062 1.31464 1.51007 1.79645 1.96193 2.26338 2.46114 2.71381 2.94525 3.29436 3.41483 ];
%ab2=441.319+[];
ab3=-708.522+[-0.669226 -0.711121 -0.801278 -0.895126 -1.02004 -1.08025 -1.24126 -1.33607 -1.45773 -1.59719 -1.73013 -1.87864 -2.01037 -2.19383 -2.29835 -2.48896 -2.61544 -2.77569 -2.92076 -3.14063 -3.2172 ];

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
figure (9)
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

title('ICR of C4 vertabrae - model 13 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ch=plot(point3,point4,'*r');
% hold on


ch=animatedline('color','r','marker','*');
for n=1:1:k-2
addpoints(ch,point3(n),point4(n));
drawnow
end
