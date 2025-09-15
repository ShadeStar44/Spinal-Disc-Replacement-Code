%% this script plots average IDP for the c3-c4 nucleus pulposus under flexion/extension, lateral bending, and axial rotation
%model 14
%% flexion/extension (4n4p) c3-c4 Average IDP
%4n
p4n=[];
x4n=[];

%4p
p4p=[];
x4p=[];

% delta loop
for n=1:20
    p4n1(n)=[p4n(n+1)-p4n(1)];
    p4p1(n)=[p4p(n+1)-p4p(1)];
end

% zero data and join
x4n1=-2*(x4n-2);
x4p1=[(x4p-2)*2];
p4p2=[0,p4p1];
x4=[flip(x4n1(2:21)),x4p1];
p4=[flip(p4n1),p4p2];

%plot
figure(1)
plot(x4,p4,'g')
ylabel('Change in Pressure (MPa)')
xlabel('Moment (Nm)')
title('IDP for C4-C5 IDP under flexion/extension')
hold on

%% lateral bending (5n5p) c3-c4 Average IDP
%5n
p5n=[];
x5n=[];

%5p
p5p=[];
x5p=[];

% delta loop
for n=1:20
    p5n1(n)=[p5n(n+1)-p5n(1)];
    p5p1(n)=[p5p(n+1)-p5p(1)];
end

% zero data and join
x5n1=-2*(x5n-2);
x5p1=[(x5p-2)*2];
p5p2=[0,p5p1];
x5=[flip(x5n1(2:21)),x5p1];
p5=[flip(p5n1),p5p2];

%plot
figure(2)
plot(x5,p5,'g')
ylabel('Change in Pressure (MPa)')
xlabel('Moment (Nm)')
title('IDP for C4-C5 IDP under lateral bending')
hold on

%% axial rotation (6n6p) c3-c4 Average IDP
%6n
p6n=[];
x6n=[];

%6p % 
p6p=[];
x6p=[];

% delta loop
for n=1:20
    p6n1(n)=[p6n(n+1)-p6n(1)];
    p6p1(n)=[p6p(n+1)-p6p(1)];
end

% zero data and join
x6n1=-2*(x6n-2);
x6p1=[(x6p-2)*2];
p6p2=[0,p6p1];
x6=[flip(x6n1(2:21)),x6p1];
p6=[flip(p6n1),p6p2];

%plot
figure(3)
plot(x6,p6,'g')
ylabel('Change in Pressure (MPa)')
xlabel('Moment (Nm)')
title('IDP for C4-C5 under axial rotation')
hold on



