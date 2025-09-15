%% This code shows ICR for the C5 vertabrae for Model5_LatSlide_Tether_5P (lateral beding to left)
% to obtain a figures for all models run the code "runscript.m"
k=21;
% right hand side node: 40338
aa1=-10.2359+[-0.0904677 -0.105639 -0.158623 -0.220552 -0.249745 -0.313842 -0.354892 -0.384827 -0.399861 -0.391279 -0.351836 -0.302971 -0.218387 -0.14209 -0.0703836 0.079149 0.195224 0.299916 0.45992 0.560875 0.697035 ];
%aa2=443.093+[];
aa3=-723+[-0.734136 -0.737143 -0.72088 -0.692503 -0.676261 -0.63031 -0.590555 -0.545124 -0.486521 -0.432379 -0.356474 -0.298897 -0.21983 -0.159619 -0.109019 -0.0153239 0.0477591 0.100696 0.176573 0.222652 0.282587 ];
% left hand side node: 36378
% original coords.
ab1=10.6649+[-0.0920449 -0.107225 -0.160555 -0.22336 -0.253188 -0.319538 -0.363233 -0.39714 -0.418611 -0.417392 -0.390613 -0.353075 -0.286744 -0.22652 -0.169824 -0.0515264 0.0410789 0.124515 0.251439 0.330911 0.437377 ];
%ab2=443.207+[];
ab3=-722.896+[-0.898556 -0.921265 -0.951892 -0.986761 -1.00449 -1.05083 -1.0911 -1.14119 -1.2081 -1.27272 -1.36648 -1.43831 -1.54036 -1.62079 -1.69012 -1.82112 -1.91116 -1.98832 -2.10228 -2.17286 -2.2669 ];

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
