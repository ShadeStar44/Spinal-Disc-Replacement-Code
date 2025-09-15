%% This code shows ICR for the C3 vertabrae for Model13_Fixed_Tether_5P (lateral beding to left)
% right hand side node: 8826
%original coords
aa1=-7.90293+[0.560845 0.633242 0.839916 1.07498 1.4046 1.56934 2.0287 2.31184 2.68502 3.12457 3.555 4.04741 4.49263 5.12191 5.47884 6.12365 6.54587 7.08133 7.56686 8.29822 8.55229 ];
%aa2=441.954+[];
aa3=-690.645+[-0.543317 -0.505893 -0.401166 -0.301888 -0.18063 -0.127202 0.00153244 0.0688856 0.146833 0.225047 0.291614 0.356697 0.406683 0.466383 0.495016 0.535988 0.556777 0.577205 0.590022 0.600274 0.602389 ];
% left hand side node: 14718
% original coords.
ab1=9.41286+[0.522916 0.580461 0.749863 0.944067 1.2141 1.34814 1.71927 1.94648 2.2439 2.59238 2.93141 3.31781 3.66605 4.15569 4.43145 4.92735 5.24946 5.65586 6.02313 6.57312 6.76277 ];
%ab2=441.501+[];
ab3=-692.656+[-0.895185 -0.965006 -1.10462 -1.24051 -1.41874 -1.50425 -1.7336 -1.86935 -2.04453 -2.24521 -2.43675 -2.64941 -2.83682 -3.09633 -3.24304 -3.50851 -3.68396 -3.90744 -4.1105 -4.41923 -4.52707 ];

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

hold on
plot(ab1,ab3,'ok')
hold on 
plot(aa1,aa3,'ok')

title('ICR of C3 vertabra - model 13 under lateral bending (5P)')
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

