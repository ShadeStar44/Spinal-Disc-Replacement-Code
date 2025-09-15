%% This code shows ICR for the C5 vertabrae for Model3_APSlide_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.088949 -0.105461 -0.16034 -0.224162 -0.254144 -0.319407 -0.360668 -0.389795 -0.403441 -0.392248 -0.349056 -0.302479 -0.237847 -0.150742 -0.0570824 0.0698263 0.184 0.323526 0.518629 0.587896 0.734424 ];
%aa2=443.093+[];
aa3=-723+[-0.731395 -0.734923 -0.719646 -0.692393 -0.676433 -0.630153 -0.590069 -0.543437 -0.4814 -0.426278 -0.350901 -0.298431 -0.237953 -0.168558 -0.103333 -0.0243295 0.0382999 0.108079 0.198944 0.23008 0.293974 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.090757 -0.107278 -0.162462 -0.227099 -0.257686 -0.325187 -0.369121 -0.402347 -0.422929 -0.419397 -0.389015 -0.352871 -0.301951 -0.232959 -0.158642 -0.0580849 0.0329913 0.1444 0.299135 0.353593 0.468161 ];
%ab2=443.207+[];
ab3=-722.896+[-0.899431 -0.92239 -0.952772 -0.986708 -1.00409 -1.05031 -1.09078 -1.14199 -1.213 -1.27915 -1.37279 -1.43863 -1.5166 -1.60943 -1.69911 -1.80995 -1.89946 -2.00187 -2.13971 -2.18779 -2.28829 ];

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
