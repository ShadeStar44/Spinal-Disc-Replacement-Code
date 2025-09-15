%% This code shows ICR for the C5 vertabrae for Model4_APSlide_NoTether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.156116 0.0533609 0.24917 0.474624 0.639117 0.91938 1.14134 1.37395 1.5778 1.78728 1.94453 2.02317 2.12474 2.22481 2.30478 2.40682 2.45865 2.54366 2.62403 2.68974 2.7573  ];
%aa2=443.093+[];
aa3=-723+[0.251507 -0.595406 -0.465363 -0.315545 -0.203297 -0.0234895 0.110064 0.245862 0.36106 0.486103 0.592803 0.65186 0.724847 0.79849 0.859128 0.940249 0.981111 1.04767 1.11031 1.16159 1.21339 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.157994 0.0381971 0.211848 0.403706 0.538917 0.764862 0.940427 1.11858 1.27087 1.42331 1.53322 1.58668 1.65997 1.7312 1.78766 1.85847 1.8943 1.95306 2.00828 2.05282 2.09823];
%ab2=443.207+[];
ab3=-722.896+[0.33556 -1.19846 -1.41143 -1.62267 -1.76386 -1.97923 -2.14087 -2.31794 -2.47523 -2.63769 -2.75501 -2.81122 -2.86971 -2.9265 -2.97026 -3.02485 -3.05258 -3.09743 -3.13972 -3.1748 -3.21175];

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
figure (6)
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

title('ICR of C4 vertabrae - model 4 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ce=plot(point3,point4,'oc');
% hold on

ce=animatedline('color','c','marker','o');
for n=1:1:k-2
addpoints(ce,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')
