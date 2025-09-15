%% This code shows ICR for the C3 vertabrae for Model5_LatSlide_Tether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[0.496908 0.550638 0.714972 0.933215 1.04885 1.34756 1.60171 1.90219 2.27308 2.61422 3.09484 3.46519 3.98221 4.38183 4.72326 5.36696 5.81653 6.19975 6.7593 7.10318 7.55796 ];
%aa2=441.954+[];
aa3=-690.645+[-1.07845 -1.04416 -0.945265 -0.833181 -0.779102 -0.65363 -0.559973 -0.461625 -0.355847 -0.271532 -0.170186 -0.102914 -0.0197106 0.036592 0.0791144 0.14716 0.18713 0.216619 0.251527 0.268488 0.285874 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[0.458863 0.49898 0.629281 0.803874 0.89609 1.13321 1.33367 1.56852 1.8568 2.12142 2.49366 2.78069 3.17931 3.48592 3.74744 4.23843 4.57981 4.86975 5.29174 5.5502 5.89089 ];
%ab2=441.501+[];
ab3=-692.656+[-1.4313 -1.49444 -1.6184 -1.75764 -1.82609 -1.99199 -2.12417 -2.27534 -2.45286 -2.60791 -2.81722 -2.9707 -3.17984 -3.33888 -3.4729 -3.72366 -3.89735 -4.04533 -4.26242 -4.39684 -4.57629];


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

title('ICR of C3 vertabra - model 5 under lateral bending (5P)')
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
