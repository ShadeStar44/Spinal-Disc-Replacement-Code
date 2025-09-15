%% This code shows ICR for the C5 vertabrae for Model13_Fixed_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.0216671 -0.0387129 -0.0893489 -0.132918 -0.180158 -0.196209 -0.217411 -0.217596 -0.199998 -0.161012 -0.104691 -0.0231921 0.0637259 0.205467 0.291963 0.45606 0.567056 0.714772 0.855176 1.07374 1.15078 ];
%aa2=443.093+[];
aa3=-723+[-0.425723 -0.428951 -0.410665 -0.383795 -0.343596 -0.324174 -0.266396 -0.228487 -0.175596 -0.112901 -0.0524136 0.0157453 0.0766063 0.161697 0.209615 0.295686 0.351854 0.421425 0.483862 0.57743 0.610077 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.0227786 -0.0398038 -0.0908002 -0.13529 -0.184474 -0.201821 -0.228178 -0.232705 -0.222468 -0.194154 -0.150124 -0.0848282 -0.014458 0.100836 0.170615 0.301437 0.388512 0.504523 0.614616 0.784186 0.843266 ];
%ab2=443.207+[];
ab3=-722.896+[-0.567765 -0.591224 -0.625376 -0.662964 -0.71673 -0.744136 -0.827655 -0.882668 -0.960961 -1.0553 -1.14744 -1.25201 -1.34556 -1.47782 -1.5539 -1.69385 -1.78675 -1.90337 -2.00871 -2.16821 -2.22359 ];

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
figure (9)
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

title('ICR of C4 vertabrae - model 13 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ch=plot(point3,point4,'*r');
% hold on


ch=animatedline('color','r','marker','*');
for n=1:1:k-2
addpoints(ch,point3(n),point4(n));
drawnow
end
