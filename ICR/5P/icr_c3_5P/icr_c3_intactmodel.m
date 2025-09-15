%% This code shows ICR for the C3 vertabrae for Model15_Intact/TLC_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 8826
%original coords
aa1=-7.90293+[0.858144 1.76178 2.94601 3.4147 4.46225 5.13055 5.93201 6.83544 7.35476 7.9807 8.47546 8.90099 9.27563 9.6461 9.94538 10.2427 10.4976 10.8125 11.0804 11.3001 11.5486 ];
%aa2=441.954+[];
aa3=-690.645+[-0.628321 -0.424771 -0.205808 -0.130099 0.013085 0.0841835 0.152347 0.204071 0.221945 0.23697 0.250637 0.268585 0.28406 0.302502 0.314961 0.326823 0.335357 0.343164 0.349 0.352223 0.353469 ];
% legt hand side node: 14718
% original coords.
ab1=9.41286+[0.808256 1.62212 2.661 3.06425 3.95111 4.50573 5.15684 5.87596 6.28303 6.76483 7.13612 7.44376 7.70857 7.97116 8.18198 8.38772 8.56162 8.77423 8.95248 9.09707 9.25976 ];
%ab2=441.501+[];
ab3=-692.656+[-1.06717 -1.39454 -1.81831 -1.98864 -2.3859 -2.65786 -3.0077 -3.42647 -3.68027 -3.99908 -4.25864 -4.48944 -4.69757 -4.89361 -5.05243 -5.2135 -5.35461 -5.53157 -5.68404 -5.81079 -5.95556 ];

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
figure (2)
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

hold on
plot(ab1,ab3,'ok')
hold on 
plot(aa1,aa3,'ok')

title('ICR of C3 vertabra - Intact model  under flexion (4P)')
xlabel('x-coords (mm)')
ylabel('z-coords (mm)')

figure(1)
% ca=plot(point3,point4,'ok');
% hold on
ca=animatedline('color','k','marker','o');
for n=1:1:k-2
addpoints(ca,point3(n),point4(n));
drawnow
end
hold on
plot(point3(1),point4(1),'color','r','marker','o')