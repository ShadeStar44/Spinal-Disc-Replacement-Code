%% This code shows ICR for the C5 vertabrae for Model15_Intact/TLC_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 48025
%original coords
%aa1=.690084
aa2=433.003+[-0.303364 -0.455641 -0.566648 -0.706849 -0.870557 -1.02757 -1.05425 -1.16489 -1.28848 -1.38651 -1.46556 -1.53495 -1.60922 -1.68144 -1.76288 -1.83296 -1.91398 -1.95584 -2.03481 -2.0819 -2.12945 ];
aa3=-728.01+[-0.558384 -0.858027 -1.03824 -1.25708 -1.51001 -1.77075 -1.81655 -2.01115 -2.24206 -2.43335 -2.59184 -2.73461 -2.8913 -3.04598 -3.22474 -3.38377 -3.57172 -3.67106 -3.86354 -3.98105 -4.10142 ];
% posterior node: 49541
% original coords.
%ab1=1.05125
ab2=448.452+[-0.291155 -0.488798 -0.630501 -0.807485 -1.01528 -1.22094 -1.2566 -1.40661 -1.57994 -1.72197 -1.83934 -1.94462 -2.0599 -2.17426 -2.30645 -2.42333 -2.56184 -2.6351 -2.77692 -2.86377 -2.95312 ];
ab3=-726.226+[-0.621173 -0.553105 -0.518115 -0.503805 -0.50364 -0.509871 -0.51103 -0.517362 -0.525472 -0.531348 -0.535963 -0.540386 -0.545121 -0.54973 -0.554973 -0.560217 -0.566585 -0.569877 -0.576193 -0.579765 -0.583299 ];

for n=2:k
ua2(n-1)=[aa2(n)-aa2(1)];
ua3(n-1)=[aa3(n)-aa3(1)];
ub2(n-1)=[ab2(n)-ab2(1)];
ub3(n-1)=[ab3(n)-ab3(1)];
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
figure (2)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab2(1)+.5*ub2(n)-aa2(1)-.5*ua2(n);ab3(1)+.5*ub3(n)-aa3(1)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra2=aa2(1)+.5*ua2(n)+t2*ya1(n);
ra3=aa3(1)+.5*ua3(n)-t2;


plot(ra2,ra3,'g')
hold on

j1=aa2(1)+T*ua2(n);
k1=aa3(1)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab2(1)+.5*ub2(n)+t*yb1(n);
rb3=ab3(1)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab2(1)+T*ub2(n);
k2=ab3(1)+T*ub3(n);
plot(j2,k2,'c')

point1(n)=[rb2(1,100)];
point2(n)=[rb3(1,100)];

end

hold on
point3=point1(1,2:20)
point4=point2(1,2:20)
plot(point3,point4,'ob');

title('ICR of C5 vertabra - Intact model  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
ca=plot(point3,point4,'ok')
hold on
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
title('ICR of C5 vertabra under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')