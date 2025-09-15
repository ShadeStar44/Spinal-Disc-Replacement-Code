%% This code shows ICR for the C5 vertabrae for Model14_Fixed_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.201401 -0.207566 -0.225322 -0.246689 -0.272383 -0.282646 -0.296495 -0.296489 -0.273037 -0.226435 -0.113035 -0.0695858 0.0955906 0.157614 0.323423 0.417313 0.58836 0.68446 0.839871 0.970218 1.09431 ];
aa2=443.093+[0.499363 0.442225 0.331652 0.242059 0.140243 0.0980891 0.0228606 -0.0490002 -0.122776 -0.203985 -0.348775 -0.398449 -0.572952 -0.635449 -0.795666 -0.880582 -1.02402 -1.10125 -1.22217 -1.32142 -1.41445 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.19928 -0.204738 -0.217531 -0.233699 -0.253595 -0.261671 -0.272543 -0.271976 -0.250866 -0.209731 -0.110261 -0.0725489 0.0703831 0.123636 0.265023 0.344376 0.48768 0.56725 0.694589 0.800097 0.899445 ];
ab2=442.054+[0.519015 0.477354 0.479269 0.52564 0.618098 0.674768 0.810264 0.963476 1.11888 1.26461 1.45325 1.50676 1.65124 1.69294 1.78521 1.83208 1.91426 1.95943 2.03063 2.08845 2.1424 ];
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

% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

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


leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')
title('ICR of C5 vertabrae under axial rotation (6P)')
legend(leg,'intact model','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14','location','northwest')