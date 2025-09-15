%% This code shows ICR for the C5 vertabrae for Model1_SlideSlide_Tether5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.243944 -0.269215 -0.267437 -0.218185 -0.10076 0.108474 0.292753 0.486817 0.701282 0.925277 1.1515 1.34833 1.56049 1.79985 1.95769 2.11372 2.26879 2.37962 2.48412 2.56948 2.65409 ];
%aa2=443.093+[];
aa3=-723+[-0.635771 -0.799542 -0.708045 -0.587715 -0.472023 -0.332912 -0.23142 -0.135744 -0.0333699 0.0730193 0.182721 0.28231 0.388758 0.515561 0.606494 0.70263 0.809418 0.892164 0.977592 1.04817 1.11791 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.244734 -0.269654 -0.270998 -0.230651 -0.128691 0.0515755 0.208333 0.371581 0.548072 0.727893 0.904896 1.05408 1.21357 1.39062 1.50534 1.62203 1.73802 1.81934 1.89416 1.95491 2.01425 ];
%ab2=443.207+[];
ab3=-722.896+[-0.506762 -0.852947 -0.990212 -1.1369 -1.29362 -1.50426 -1.66073 -1.8086 -1.96888 -2.13177 -2.29507 -2.44215 -2.59201 -2.75624 -2.85827 -2.94058 -3.01154 -3.06067 -3.10671 -3.14439 -3.18299 ];

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
figure (3)
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

title('ICR of C4 vertabrae - model 1 under lateral bending (5P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% cb=plot(point3,point4,'or');
% hold on


cb=animatedline('color','r','marker','o');
for n=1:1:k-2
addpoints(cb,point3(n),point4(n));
drawnow
end
