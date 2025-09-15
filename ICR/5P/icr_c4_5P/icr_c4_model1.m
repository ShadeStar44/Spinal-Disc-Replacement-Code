%% This code shows ICR for the C4 vertabrae for Model1_SlideSlide_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 25442
aa1=-9.10926+[-0.271321 -0.110255 0.148968 0.499396 0.918188 1.48662 1.92542 2.35693 2.82218 3.29709 3.77108 4.18475 4.6171 5.09941 5.41692 5.72292 6.02899 6.25166 6.47244 6.65235 6.82885 ];
%aa2=441.284+[];
aa3=-708.334+[-0.536846 -0.65698 -0.496826 -0.31446 -0.154278 0.00979721 0.117186 0.213487 0.312369 0.411705 0.511705 0.599687 0.691698 0.799023 0.876094 0.961129 1.05709 1.13241 1.20989 1.27137 1.33009 ];
% left hand side node: 31324
% original coords.
ab1=9.66499+[-0.27227 -0.119673 0.116682 0.425924 0.789163 1.27568 1.64643 2.00686 2.38935 2.77282 3.14836 3.46957 3.80142 4.16597 4.40146 4.62798 4.85169 5.01089 5.1661 5.29068 5.41042 ];
%ab2=441.319+[];
ab3=-708.522+[-0.579496 -0.994594 -1.21851 -1.45806 -1.69923 -1.99228 -2.20193 -2.3991 -2.61131 -2.82683 -3.04424 -3.24088 -3.44527 -3.67631 -3.82853 -3.96689 -4.10245 -4.20515 -4.31159 -4.40135 -4.49275 ];

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
