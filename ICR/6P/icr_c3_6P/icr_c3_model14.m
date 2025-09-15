%% This code shows ICR for the C3 vertabrae for Model4_Fixed_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[-0.218943 -0.134017 0.0318614 0.201202 0.428582 0.540455 0.77619 1.02545 1.29683 1.57542 2.00602 2.14523 2.60871 2.77143 3.18536 3.40997 3.80721 4.02499 4.36963 4.65104 4.91399 ];
aa2=442.794+[2.67788 2.68222 2.78525 2.89991 3.05119 3.12242 3.26556 3.4086 3.55128 3.68434 3.85954 3.91151 4.06433 4.11146 4.21814 4.2709 4.35621 4.40122 4.47 4.52508 4.57611 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[-0.21561 -0.121288 0.0693966 0.270322 0.549536 0.690404 0.994278 1.32505 1.69297 2.07613 2.67032 2.86378 3.50732 3.73338 4.309 4.62331 5.18208 5.49119 5.98372 6.38963 6.77278];
ab2=442.825+[2.44932 2.3416 2.15948 1.9788 1.73651 1.61756 1.36677 1.10418 0.82766 0.558975 0.184078 0.070036 -0.282329 -0.398829 -0.684006 -0.8355 -1.0995 -1.24316 -1.46887 -1.65193 -1.82272];
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
figure (10)
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

title('ICR of C3 vertabrae - model 14 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ci=plot(point3,point4,'*g');

ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end


title('ICR of C3 Vertabrae under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
legend([leg],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14','location','northeast')