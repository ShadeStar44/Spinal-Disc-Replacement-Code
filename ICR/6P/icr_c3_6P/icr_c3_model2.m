%% This code shows ICR for the C3 vertabrae for Model2_SlideSlide_NoTether_6P (axial rotation)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 9
aa1=10.4271+[-0.0859117 0.0597176 0.372165 0.594499 0.971034 1.31588 1.7257 2.0848 2.53958 2.93565 3.4023 3.86518 4.26844 4.72853 4.99759 5.47416 5.66417 5.98066 6.1895 6.41408 6.60251 ];
aa2=442.794+[2.87779 2.86154 2.95575 3.03473 3.17428 3.29306 3.41025 3.49138 3.56737 3.61747 3.6653 3.70275 3.73147 3.76414 3.78449 3.82369 3.84083 3.87262 3.8967 3.92508 3.95032 ];
% aa3=-690.774+[];
% left hand side node: 4114
% original coords.
ab1=-8.67116+[-0.0758553 0.0868889 0.449265 0.715736 1.18303 1.62494 2.15865 2.62873 3.22296 3.7407 4.35496 4.97052 5.51415 6.14382 6.51761 7.19204 7.46601 7.93025 8.24441 8.59066 8.888];
ab2=442.825+[2.60855 2.39444 2.04308 1.80467 1.4003 1.03234 0.619114 0.286264 -0.0877534 -0.389135 -0.729114 -1.05797 -1.34457 -1.67188 -1.86441 -2.21173 -2.35329 -2.59425 -2.76017 -2.94706 -3.11065 ];
% ab3=-689.315+[];

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
figure (4)
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

hold on
plot(ab1,ab2,'ok')
hold on 
plot(aa1,aa2,'ok')

title('ICR of C3 vertabrae - model 2 under axial rotation (6P)')
xlabel('x-coords (mm)')
ylabel('y-coords (mm)')

figure(1)
% cc=plot(point3,point4,'og');
% hold on

cc=animatedline('color','g','marker','o');
for n=1:1:k-2
addpoints(cc,point3(n),point4(n));
drawnow
end
