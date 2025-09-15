%% This code shows ICR for the C5 vertabrae for Model5_LatSlide_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.0904677 -0.0860821 -0.102088 -0.126853 -0.14625 -0.170026 -0.191487 -0.195178 -0.177531 -0.141561 -0.0882826 -0.00754359 0.0804421 0.202421 0.350388 0.427377 0.553172 0.683863 0.93649 0.969906 1.07191 ];
aa2=443.093+[0.224174 0.192827 0.129355 0.0720243 0.0271373 -0.0341913 -0.110844 -0.161078 -0.223973 -0.287093 -0.362298 -0.456884 -0.552324 -0.677846 -0.823034 -0.895574 -1.00854 -1.11969 -1.32517 -1.35191 -1.43287 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.0831776 -0.077743 -0.0906168 -0.112201 -0.129301 -0.150535 -0.170851 -0.175713 -0.162026 -0.132535 -0.0887311 -0.0213454 0.0528705 0.156087 0.280865 0.345294 0.44988 0.557753 0.763251 0.790094 0.871643 ];
ab2=442.054+[0.417556 0.415571 0.449017 0.510503 0.57215 0.678532 0.853032 0.976513 1.14677 1.29552 1.43426 1.56878 1.66409 1.75671 1.84028 1.87889 1.93824 1.99595 2.10136 2.11489 2.15537 ];
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
figure (7)
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
% 
% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - model 5 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cf=plot(point3,point4,'om');
% hold on

cf=animatedline('color','m','marker','o');
for n=1:1:k-2
addpoints(cf,point3(n),point4(n));
drawnow
end

