%% This code shows ICR for the C5 vertabrae for Model13_Fixed_Tether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.0216671 -0.0173032 -0.0370694 -0.0608818 -0.0841091 -0.100046 -0.105534 -0.084383 -0.0299193 0.0418547 0.137269 0.228022 0.354048 0.454625 0.65793 0.739672 0.890826 0.982529 1.13368 1.24371 1.35317 ];
aa2=443.093+[0.225259 0.18182 0.0987861 0.0260943 -0.0483815 -0.105302 -0.182798 -0.251814 -0.343943 -0.437603 -0.544134 -0.639517 -0.765887 -0.862556 -1.04036 -1.10758 -1.22686 -1.29728 -1.41138 -1.49348 -1.57578 ];
% aa3=-723+[];
% left hand side node: 35429
% original coords.
ab1=10.7943+[-0.0148359 -0.00905276 -0.0245775 -0.0445018 -0.0645584 -0.0792765 -0.0854611 -0.067672 -0.0212023 0.040055 0.121807 0.198953 0.305756 0.390432 0.560037 0.627427 0.750957 0.825109 0.945983 1.03288 1.11829 ];
ab2=442.054+[0.392925 0.388456 0.435955 0.515891 0.62936 0.728813 0.897701 1.05039 1.22116 1.35466 1.47179 1.5594 1.64968 1.70878 1.81746 1.85957 1.935 1.97978 2.05193 2.10355 2.1537 ];
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

% hold on
% plot(ab1,ab2,'ok')
% hold on 
% plot(aa1,aa2,'ok')

title('ICR of C4 vertabrae - model 13 under axial rotation (6P)')
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

