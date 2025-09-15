%% This code shows ICR for the C4 vertabrae for Model3_APSlide_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[0.150594 0.160027 0.18397 0.224235 0.249029 0.323355 0.397471 0.500169 0.649653 0.799519 1.02639 1.19795 1.40622 1.65785 1.9058 2.21937 2.48329 2.79066 3.20539 3.35029 3.65299 ];
%aa2=441.284+[];
aa3=-708.334+[-0.625468 -0.618352 -0.561343 -0.482339 -0.441119 -0.339465 -0.25955 -0.174343 -0.0763325 0.00135477 0.0976671 0.160449 0.229569 0.304922 0.372366 0.450418 0.510789 0.575433 0.655443 0.68209 0.735578 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[0.13935 0.147084 0.164348 0.193641 0.211758 0.266495 0.321664 0.399798 0.515253 0.633209 0.813725 0.951062 1.11741 1.31762 1.51409 1.76117 1.96836 2.20906 2.5318 2.64373 2.87638 ];
%ab2=441.319+[];
ab3=-708.522+[-1.00349 -1.04014 -1.11711 -1.20967 -1.2564 -1.37077 -1.4632 -1.56865 -1.69717 -1.80619 -1.95099 -2.04963 -2.16397 -2.29671 -2.42278 -2.57708 -2.70267 -2.84566 -3.0367 -3.1034 -3.24306 ];

for n=2:k
ua1(n-1)=[aa1(n)-aa1(n-1)];
ua3(n-1)=[aa3(n)-aa3(n-1)];
ub1(n-1)=[ab1(n)-ab1(n-1)];
ub3(n-1)=[ab3(n)-ab3(n-1)];
end

% U(n)• R(n)=0, R(n)=y,z assuming z=-1, y=-ua3/ua2
 for n=1:k-1
    ya1(n)=ua3(n)/ua1(n);
    yb1(n)=ub3(n)/ub1(n);
 end
 %r1,r2 are the perendicular vectors to the displacement vector.
%  i=-1*ones(size(ya1))';
%  r1=[ya1',i];
%  r2=[yb1',i];

t=linspace(0,30.0681,10000);
T=linspace(0,1,10000);

%% 0-2 Nm
figure (5)
for n=2:k-1
m1=[ya1(n), -yb1(n);-1, 1];
m2=[ab1(n)+.5*ub1(n)-aa1(n)-.5*ua1(n);ab3(n)+.5*ub3(n)-aa3(n)-.5*ua3(n)];
c=m1\m2;

t=linspace(0,c(2,1),100);
t2=linspace(0,c(1,1),100);

ra1=aa1(n)+.5*ua1(n)+t2*ya1(n);
ra3=aa3(n)+.5*ua3(n)-t2;


plot(ra1,ra3,'g')
hold on

j1=aa1(n)+T*ua1(n);
k1=aa3(n)+T*ua3(n);
plot(j1,k1,'c')
hold on

rb2=ab1(n)+.5*ub1(n)+t*yb1(n);
rb3=ab3(n)+.5*ub3(n)-t;
plot(rb2,rb3,'g')
hold on

j2=ab1(n)+T*ub1(n);
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
% plot(ab1,ab3,'ok')
% hold on 
% plot(aa1,aa3,'ok')

title('ICR of C4 vertabrae - model 3 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cd=plot(point3,point4,'ob');
% hold on


cd=animatedline('color','b','marker','o');
for n=1:1:k-2
addpoints(cd,point3(n),point4(n));
drawnow
end
