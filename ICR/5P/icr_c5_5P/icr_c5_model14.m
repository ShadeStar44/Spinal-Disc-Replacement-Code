%% This code shows ICR for the C5 vertabrae for Model14_Fixed_Notether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.201401 -0.161446 -0.00970403 0.0875517 0.289935 0.497306 0.658768 0.848697 1.06608 1.27994 1.45718 1.71526 1.85729 2.07911 2.20159 2.34183 2.43446 2.52689 2.61135 2.68263 2.73732 ];
%aa2=443.093+[];
aa3=-723+[-0.300008 -0.46719 -0.301217 -0.228232 -0.100162 0.0145058 0.100167 0.200571 0.313904 0.4251 0.516784 0.648643 0.721725 0.841444 0.918554 1.01377 1.08031 1.15066 1.21583 1.269 1.3092 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.202276 -0.162013 -0.020577 0.0670885 0.244728 0.421689 0.556235 0.711058 0.884432 1.05079 1.18536 1.37596 1.47998 1.64027 1.72603 1.8279 1.89398 1.95844 2.01586 2.06412 2.10054 ];
%ab2=443.207+[];
ab3=-722.896+[-0.16271 -0.568938 -0.825365 -0.946321 -1.1642 -1.36297 -1.50793 -1.66991 -1.84463 -2.01293 -2.15526 -2.36285 -2.47428 -2.64223 -2.72938 -2.81165 -2.86564 -2.91927 -2.97039 -3.01394 -3.04853 ];

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
figure (10)
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

title('ICR of C4 vertabrae - model 14 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ci=plot(point3,point4,'*g');


ci=animatedline('color','g','marker','*');
for n=1:1:k-2
addpoints(ci,point3(n),point4(n));
drawnow
end


title('ICR of C5 vertabrae under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')
leg=[ca,cb,cc,cd,ce,cf,cg,ch,ci];
legend([leg],'intact model','model 1','model 2','model 3','model 4','model 5','model 6','model 13', 'model 14','location','northwest')

