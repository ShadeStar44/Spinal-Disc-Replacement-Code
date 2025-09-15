%% This code shows ICR for the C3 vertabrae for Model15_Intact/TLC_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[-0.0363006 -1.22842 -1.90506 -2.69729 -3.58258 -4.44829 -4.59737 -5.2175 -5.93081 -6.50885 -6.98133 -7.39958 -7.85157 -8.29002 -8.78698 -9.21812 -9.71799 -9.97858 -10.4745 -10.7728 -11.0756 ];
aa3=-695.382+[-0.9215 -1.48386 -1.80152 -2.23569 -2.77558 -3.34438 -3.44662 -3.88471 -4.41414 -4.8622 -5.24077 -5.58579 -5.96969 -6.35214 -6.7982 -7.19795 -7.67631 -7.93172 -8.42991 -8.73696 -9.0548 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[-0.0609291 -1.35365 -2.09537 -2.98037 -3.99085 -5.00074 -5.17716 -5.91895 -6.78912 -7.50841 -8.10569 -8.64193 -9.23017 -9.80922 -10.476 -11.065 -11.7605 -12.1285 -12.8398 -13.2745 -13.7217 ];
ab3=-693.523+[-0.794764 -0.678845 -0.639957 -0.631298 -0.655208 -0.70722 -0.718587 -0.773938 -0.854147 -0.93143 -1.00405 -1.07568 -1.16047 -1.25054 -1.36273 -1.46901 -1.60312 -1.6777 -1.82932 -1.92668 -2.03035 ];

% creating a displacement vector (node 27616,29008)from nth time increment to
% initial position.
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

title('ICR of C3 vertabra - Intact model  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
ca=plot(point3,point4,'ok')
hold on
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
title('ICR of C3 vertabra - Intact model under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')