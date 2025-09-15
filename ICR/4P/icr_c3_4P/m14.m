%% This code shows ICR for the C3 vertabrae for Model14_Fixed_NoTether_4P
% To obtain a single graph and legend for all models,start with intactmodel and run each model within
% the file.
k=21;
% anterior node: 11016
%original coords
%aa1=1.14263
aa2=433.153+[2.30436 1.75183 0.578272 -0.154264 -1.29415 -2.05272 -3.34384 -3.88416 -5.08473 -5.25343 -6.05237 -6.57169 -7.06863 -7.66984 -8.16082 -8.68832 -9.15618 -9.69732 -10.1754 -10.7529 -10.944 ];
aa3=-695.382+[0.0603907 -0.469886 -0.993545 -1.2942 -1.76357 -2.10404 -2.76064 -3.06278 -3.79005 -3.89726 -4.42345 -4.77935 -5.13101 -5.57136 -5.94274 -6.35423 -6.73152 -7.18378 -7.59666 -8.11268 -8.28793 ];
% posterior node: 12394
% original coords.
%ab1=.821493
ab2=448.7+[2.37488 1.79691 0.532279 -0.261424 -1.50736 -2.34753 -3.80566 -4.42867 -5.84226 -6.04405 -7.01108 -7.64965 -8.26865 -9.02827 -9.65745 -10.3429 -10.9602 -11.6856 -12.337 -13.1379 -13.4068 ];
ab3=-693.523+[-0.741063 -0.99272 -0.733403 -0.631823 -0.523338 -0.484273 -0.471115 -0.480441 -0.536245 -0.547741 -0.615891 -0.671206 -0.732652 -0.818818 -0.899187 -0.995712 -1.09052 -1.21244 -1.33084 -1.48778 -1.54286 ];

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
% hold on
% plot(ab2,ab3,'ob')

title('ICR of C3 vertabra - model 14  under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ck=plot(point3,point4,'*g');

ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','*')


hold on
plot(point3(1),point4(1),'color','r','marker','*')

leg=[ca,ce,ci];
title('ICR of C3 vertabra under flexion (4P)')
xlabel('y-coords (mm)')
ylabel('z-coords (mm)')
legend(leg,'intact','model 4','model 14','location','northwest')
