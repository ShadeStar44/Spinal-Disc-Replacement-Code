%% This code shows ICR for the C4 vertabrae for Model6_LatSlide_NoTether_4P
% To obtain a single graph and legend for all models, run each model, runing the
% intact version last.
k=21;
% anterior node: 27588
%original coords
%aa1=-1.51748
aa2=432.212+[0.923125 0.296318 -0.0760693 -0.878327 -1.44283 -2.02181 -2.49042 -2.957 -3.55008 -3.76487 -4.12156 -4.42138 -4.67166 -4.97568 -5.29143 -5.53264 -5.80566 -6.05841 -6.36339 -6.54115 -6.72365 ];
aa3=-710.702+[0.991583 -0.672595 -0.954039 -1.42817 -1.77064 -2.16039 -2.50577 -2.87354 -3.37373 -3.56306 -3.88678 -4.16731 -4.40743 -4.70687 -5.02655 -5.27766 -5.56894 -5.84553 -6.18799 -6.39257 -6.60801 ];
% posterior node: 28996
% original coords.
%ab1=-.916991
ab2=447.427+[1.13011 0.378863 -0.0868853 -1.04973 -1.72894 -2.43986 -3.02808 -3.62723 -4.41071 -4.70012 -5.18782 -5.6044 -5.95701 -6.39116 -6.84876 -7.20395 -7.61223 -7.99651 -8.46856 -8.74844 -9.04093 ];
ab3=-706.916+[0.0682566 -0.978563 -0.870323 -0.760548 -0.733105 -0.73301 -0.751615 -0.781435 -0.832791 -0.85622 -0.900243 -0.942888 -0.98254 -1.03681 -1.10062 -1.15398 -1.21891 -1.28335 -1.36681 -1.41838 -1.47328 ];

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
figure (9)
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

title('ICR of C4 vertabra - Model 6 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(2)
cg=plot(point3,point4,'*r')
hold on
title('ICR of C4 vertabra - Model 6 under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
