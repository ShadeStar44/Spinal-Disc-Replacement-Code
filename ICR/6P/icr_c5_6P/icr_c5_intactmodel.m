%% This code shows ICR for the C5 vertabrae for Model15_Intact/TLC_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[0.13272 0.216206 0.316581 0.447679 0.598036 0.725487 0.880472 1.01714 1.13093 1.23861 1.34702 1.44015 1.52024 1.60265 1.68977 1.76188 1.8256 1.89847 1.96247 2.01492 2.06873 ];
aa2=443.093+[-0.426961 -0.580732 -0.688615 -0.803486 -0.894884 -0.955075 -1.02408 -1.0869 -1.14445 -1.20406 -1.26901 -1.32943 -1.38762 -1.45373 -1.53001 -1.59621 -1.65695 -1.7302 -1.79711 -1.85392 -1.91452 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[0.139577 0.226623 0.322477 0.441919 0.573285 0.68183 0.811912 0.92397 1.01573 1.10128 1.18558 1.25627 1.31628 1.3773 1.4409 1.49271 1.53777 1.5885 1.63225 1.66745 1.70294 ];
ab2=442.054+[-0.151374 0.12097 0.358213 0.598823 0.853645 1.05376 1.25412 1.40501 1.52226 1.62762 1.73187 1.82004 1.88822 1.95381 2.01856 2.07084 2.11577 2.16513 2.20776 2.24296 2.27879];
% ab3=-723.173+[];

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

% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - Intact model under axial rotation (6P)')
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