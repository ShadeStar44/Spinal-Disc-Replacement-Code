%% This code shows ICR for the C4 vertabrae for Model5_LatSlide_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[0.128248 0.135219 0.155623 0.192588 0.215811 0.28603 0.35673 0.454955 0.5938 0.738335 0.962955 1.14867 1.42021 1.63867 1.82987 2.20098 2.46793 2.69985 3.04344 3.25624 3.53919 ];
%aa2=441.284+[];
aa3=-708.334+[-0.615506 -0.608208 -0.552993 -0.476949 -0.437167 -0.338289 -0.260061 -0.175777 -0.0815701 -0.0039536 0.0950015 0.164782 0.255157 0.320522 0.373338 0.467118 0.528362 0.578007 0.646428 0.686614 0.737531 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[0.116211 0.121467 0.135282 0.161574 0.178335 0.2296 0.281973 0.356337 0.463206 0.576642 0.754798 0.903093 1.11948 1.29283 1.44406 1.73608 1.94551 2.12686 2.39431 2.55889 2.7765 ];
%ab2=441.319+[];
ab3=-708.522+[-1.00689 -1.04318 -1.11877 -1.20903 -1.25457 -1.36623 -1.45647 -1.55982 -1.68168 -1.78896 -1.93507 -2.04308 -2.19199 -2.30676 -2.40429 -2.58723 -2.71368 -2.82162 -2.98 -3.07792 -3.20845 ];

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
figure (7)
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

title('ICR of C4 vertabrae - model 5 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cf=plot(point3,point4,'om');
% hold on


cf=animatedline('color','m','marker','o');
for n=1:1:k-2
addpoints(cf,point3(n),point4(n));
drawnow
end
