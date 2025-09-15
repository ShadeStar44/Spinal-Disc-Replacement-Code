%% This code shows ICR for the C4 vertabrae for Model14_Fixed_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 19353
aa1=-10.0093+[-0.221777 -0.184775 -0.100323 -0.00815097 0.123751 0.192288 0.345747 0.52023 0.726214 0.953067 1.32842 1.45451 1.88467 2.03741 2.4302 2.64683 3.03395 3.24908 3.59307 3.87807 4.14798 ];
aa2=441.02+[1.35262 1.25447 1.07473 0.907377 0.694901 0.596189 0.397418 0.196928 -0.0103418 -0.21328 -0.509427 -0.602594 -0.902816 -1.00462 -1.25767 -1.39234 -1.62458 -1.75025 -1.94653 -2.10601 -2.25506 ];
% aa3=-705.595+[];
% left hand side node: 15530
% original coords.
ab1=10.0999+[-0.228688 -0.197143 -0.12887 -0.0582181 0.0378956 0.0861742 0.191687 0.309391 0.449097 0.605398 0.871043 0.960841 1.27039 1.38041 1.66331 1.81862 2.09446 2.24628 2.48714 2.68489 2.87038 ];
ab2=441.349+[1.5493 1.52616 1.57336 1.65425 1.78006 1.84758 1.99589 2.1515 2.30913 2.45243 2.63057 2.68066 2.81743 2.85822 2.94888 2.99433 3.072 3.11447 3.18098 3.23439 3.28396 ];
% ab3=-706.583+[];

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

title('ICR of C4 vertabrae - model 14 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% ci=plot(point3,point4,'*g');
ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end

title('ICR of C4 Vertabrae under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
legend([leg],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14','location','southeast')
