%% This code shows ICR for the C4 vertabrae for Model14_Fixed_NoTether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[1.16247 0.771796 0.23782 -0.16477 -0.82678 -1.27329 -2.02065 -2.32854 -3.00588 -3.10089 -3.55 -3.84179 -4.12106 -4.45943 -4.73636 -5.03462 -5.29951 -5.60613 -5.87693 -6.20327 -6.3105];
aa3=-710.702+[0.387084 -0.0153086 -0.450869 -0.696253 -1.08121 -1.35464 -1.86436 -2.08998 -2.62239 -2.69999 -3.07833 -3.33212 -3.5808 -3.89009 -4.14945 -4.43557 -4.69624 -5.00712 -5.28969 -5.64164 -5.7606 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.37495 0.952704 0.283135 -0.199093 -0.98939 -1.5271 -2.44735 -2.83522 -3.70857 -3.83308 -4.42911 -4.82277 -5.20431 -5.67303 -6.06191 -6.48652 -6.86926 -7.3194 -7.72362 -8.22042 -8.38662 ];
ab3=-706.916+[-0.566494 -0.792163 -0.596572 -0.522119 -0.443872 -0.417975 -0.412316 -0.418035 -0.450369 -0.456873 -0.494902 -0.524942 -0.557949 -0.604002 -0.646765 -0.697913 -0.747743 -0.81169 -0.873642 -0.955118 -0.983288 ];

% creating a displacement vector (node 27616,29008)from nth time increment to
% initial position.
for n=2:k
ua2(n-1)=[aa2(n)-aa2(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub2(n-1)=[ab2(n)-ab2(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua3(n)/ua2(n);
    yb1(n)=ub3(n)/ub2(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];

t=linspace(0,30.0681,10000);
T=linspace(0,1,10000);

%% 0-2 Nm
figure (11)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab2(n)+.5*ub2(n)-aa2(n)-.5*ua2(n);ab3(n)+.5*ub3(n)-aa3(n)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(n)+.5*ua2(n)+t2*ya1(n);
ra3=aa3(n)+.5*ua3(n)-t2;


plot(ra2,ra3,'g')
hold on

j1=aa2(n)+T*ua2(n);
k1=aa3(n)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab2(n)+.5*ub2(n)+t*yb1(n);
rb3=ab3(n)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(n)+T*ub2(n);
k2=ab3(n)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20);
point4=point2(1,2:20);
plot(point3,point4,'ob');

title('ICR of C4 vertabra - Model 13 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
hold on
plot(aa2,aa3,'ob')

figure(2)
% ci=plot(point3,point4,'*b');

ci=animatedline('color','b','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end

leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci]
title('ICR of C4 vertabra under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact model','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14','location','northeast')