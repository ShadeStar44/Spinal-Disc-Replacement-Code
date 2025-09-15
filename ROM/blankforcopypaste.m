%% Range of  motion for model4_APslide_NoTether
%% Part-2-1.LOADNODE
% extension (4N) data converted to degrees
ta=[];
ur1a=(180/pi)*([]);
ur2a=(180/pi)*([]);
ur3a=(180/pi)*([]);

% flexion (4P) data converted to degrees
tb=[];
ur1b=(180/pi)*([]);
ur2b=(180/pi)*([]);
ur3b=(180/pi)*([]);

% lateral bending (5N) data converted to degrees
ta5=[];
ur1a5=(180/pi)*([]);
ur2a5=(180/pi)*([]);
ur3a5=(180/pi)*([]);
% lateral bending (5P) data converted to degrees
tb5=[];
ur1b5=(180/pi)*([]);
ur2b5=(180/pi)*([]);
ur3b5=(180/pi)*([]);

% axial roation (6N) data converted to degrees.
ta6=[];
ur1a6=(180/pi)*([]);
ur2a6=(180/pi)*([]);
ur3a6=(180/pi)*([]);

% axial rotation (6P) data converted to degrees
tb6=[];
ur1b6=(180/pi)*([]);
ur2b6=(180/pi)*([]);
ur3b6=(180/pi)*([]);

%% Part-2-1.N-C4-EP
% extension (4N) data converted to degrees
tc=[];
ur1c=(180/pi)*([]);
ur2c=(180/pi)*([]);
ur3c=(180/pi)*([]);

% flexion (4P) data converted to degrees
td=[];
ur1d=(180/pi)*([]);
ur2d=(180/pi)*([]);
ur3d=(180/pi)*([]);

% lateral bending (5N) data converted to degrees
tc5=[];
ur1c5=(180/pi)*([]);
ur2c5=(180/pi)*([]);
ur3c5=(180/pi)*([]);

% lateral bending (5P) data converted to degrees
td5=[];
ur1d5=(180/pi)*([]);
ur2d5=(180/pi)*([]);
ur3d5=(180/pi)*([]);

% axial rotation (6N) data converted to degrees
tc6=[];
ur1c6=(180/pi)*([]);
ur2c6=(180/pi)*([]);
ur3c6=(180/pi)*([]);

% axial rotation (6P) data converted to degrees
td6=[];
ur1d6=(180/pi)*([]);
ur2d6=(180/pi)*([]);
ur3d6=(180/pi)*([]);

%% part-2-1.N-C5-EP
% extension (4N) data converted to degrees
te=[];
ur1e=(180/pi)*([]);
ur2e=(180/pi)*([]);
ur3e=(180/pi)*([]);

% flexion (4P) data converted to degrees
tf=[];
ur1f=(180/pi)*([]);
ur2f=(180/pi)*([]);
ur3f=(180/pi)*([]);

% lateral bending (5N) data converted to degrees
te5=[];
ur1e5=(180/pi)*([]);
ur2e5=(180/pi)*([]);
ur3e5=(180/pi)*([]);

% lateral bending (5P) data converted to degrees
tf5=[];
ur1f5=(180/pi)*([]);
ur2f5=(180/pi)*([]);
ur3f5=(180/pi)*([]);

% axial rotation (6N) data converted to degrees
te6=[];
ur1e6=(180/pi)*([]);
ur2e6=(180/pi)*([]);
ur3e6=(180/pi)*([]);

% axial rotation (6P) data converted to degrees
tf6=[];
ur1f6=(180/pi)*([]);
ur2f6=(180/pi)*([]);
ur3f6=(180/pi)*([]);

%% part-2-1.N-C6-EP
% extension (4N) data converted to degrees
tg=[];
ur1g=(180/pi)*([]);
ur2g=(180/pi)*([]);
ur3g=(180/pi)*([]);

% flexion (4P) data converted to degrees
tf=[];
ur1h=(180/pi)*([]);
ur2h=(180/pi)*([]);
ur3h=(180/pi)*([]);

% lateral bending (5N) data converted to degrees
tg5=[];
ur1g5=(180/pi)*([]);
ur2g5=(180/pi)*([]);
ur3g5=(180/pi)*([]);

% lateral bending (5P) data converted to degrees
th5=[];
ur1h5=(180/pi)*([]);
ur2h5=(180/pi)*([]);
ur3h5=(180/pi)*([]);

% axial rotation (6N) data converted to degrees
tg6=[];
ur1g6=(180/pi)*([]);
ur2g6=(180/pi)*([]);
ur3g6=(180/pi)*([]);

% axial rotation (6P) data converted to degrees
th6=[];
ur1h6=(180/pi)*([]);
ur2h6=(180/pi)*([]);
ur3h6=(180/pi)*([]);

%% part-2-1.N-C7-EP
% flexion (4N) data converted to degrees
ti=[];
ur1i=(180/pi)*([]);
ur2i=(180/pi)*([]);
ur3i=(180/pi)*([]);

% extension (4P) data converted to degrees
th=[];
ur1j=(180/pi)*([]);
ur2j=(180/pi)*([]);
ur3j=(180/pi)*([]);

% lateral bending (5N) data converted to degrees
ti5=[];
ur1i5=(180/pi)*([]);
ur2i5=(180/pi)*([]);
ur3i5=(180/pi)*([]);
% lateral bending (5P) data converted to degrees
tj5=[];
ur1j5=(180/pi)*([]);
ur2j5=(180/pi)*([]);
ur3j5=(180/pi)*([]);

% axial rotation (6N) data converted to degrees
tj6=[];
ur1j6=(180/pi)*([]);
ur2j6=(180/pi)*([]);
ur3j6=(180/pi)*([]);

% axial rotation (6P) data converted to degrees
ti6=[];
ur1i6=(180/pi)*([]);
ur2i6=(180/pi)*([]);
ur3i6=(180/pi)*([]);

%% join ROM data
% LOADNODE
% (4N&4P)
u1a=[flip(ur1a(2:21)),ur1b];
u2a=[flip(ur2a(2:21)),ur2b];
u3a=[flip(ur3a(2:21)),ur3b];
t1=[2*(-1*flip(ta(2:21))+2),(tb-2)*2];

%(5N&5P)
t2=[2*(-1*flip(ta5(2:21))+2),(tb5-2)*2];
u1a5=[flip(ur1a5(2:21)),ur1b5];
u2a5=[flip(ur2a5(2:21)),ur2b5];
u3a5=[flip(ur3a5(2:21)),ur3b5];

%(6N&6P)
tab6=[2*(-1*flip(ta6(2:21))+2),(tb6-2)*2];
u1a6=[flip(ur1a6(2:21)),ur1b6];
u2a6=[flip(ur2a6(2:21)),ur2b6];
u3a6=[flip(ur3a6(2:21)),ur3b6];

% C4
% (4N&4P)
u1z=[flip(ur1c(2:21)),ur1d];
u2z=[flip(ur2c(2:21)),ur2d];
u3z=[flip(ur3c(2:21)),ur3d];
t3=[2*(-1*flip(tc(2:21))+2),(td-2)*2];

%(5N&5P)
t4=[2*(-1*flip(tc5(2:21))+2),(td5-2)*2];
u1z5=[flip(ur1c5(2:21)),ur1d5];
u2z5=[flip(ur2c5(2:21)),ur2d5];
u3z5=[flip(ur3c5(2:21)),ur3d5];


% 6N & 6P
t20=[2*(-1*flip(tc6(2:21))+2),(td6-2)*2];
u1c6=[flip(ur1c6(2:21)),ur1d6];
u2c6=[flip(ur2c6(2:21)),ur2d6];
u3c6=[flip(ur3c6(2:21)),ur3d6];


% C5
% (4N&4P)
u1y=[flip(ur1e(2:21)),ur1f];
u2y=[flip(ur2e(2:21)),ur2f];
u3y=[flip(ur3e(2:21)),ur3f];
t5=[2*(-1*flip(te(2:21))+2),(tf-2)*2];


%(5N&5P)
t6=[2*(-1*flip(te5(2:21))+2),(tf5-2)*2];
u1y5=[flip(ur1e5(2:21)),ur1f5];
u2y5=[flip(ur2e5(2:21)),ur2f5];
u3y5=[flip(ur3e5(2:21)),ur3f5];

%(6N&6P)
t21=[2*(-1*flip(te6(2:21))+2),(tf6-2)*2];
u1e6=[flip(ur1e6(2:21)),ur1f6];
u2e6=[flip(ur2e6(2:21)),ur2f6];
u3e6=[flip(ur3e6(2:21)),ur3f6];

% C6
% (4N&4P)
u1x=[flip(ur1g(2:21)),ur1h];
u2x=[flip(ur2g(2:21)),ur2h];
u3x=[flip(ur3g(2:21)),ur3h];
t7=[2*(-1*flip(tg(2:21))+2),(tf-2)*2];

%(5N&5P)
t8=[2*(-1*flip(tg5(2:21))+2),(th5-2)*2];
u1x5=[flip(ur1g5(2:21)),ur1h5];
u2x5=[flip(ur2g5(2:21)),ur2h5];
u3x5=[flip(ur3g5(2:21)),ur3h5];

% 6N & 6P
t22=[2*(-1*flip(tg6(2:21))+2),(th6-2)*2];
u1g6=[flip(ur1g6(2:21)),ur1h6];
u2g6=[flip(ur2g6(2:21)),ur2h6];
u3g6=[flip(ur3g6(2:21)),ur3h6];


% C7
% (4N&4P)
u1w=[flip(ur1i(2:21)),ur1j];
u2w=[flip(ur2i(2:21)),ur2j];
u3w=[flip(ur3i(2:21)),ur3j];
t9=[2*(-1*flip(ti(2:21))+2),(th-2)*2];

%(5N&5P)
t10=[2*(-1*flip(ti5(2:21))+2),(tj5-2)*2];
u1w5=[flip(ur1g5(2:21)),ur1h5];
u2w5=[flip(ur2g5(2:21)),ur2h5];
u3w5=[flip(ur3g5(2:21)),ur3h5];

% 6N & 6P
t23=[2*(-1*flip(tj6(2:21))+2),(ti6-2)*2];
u1i6=[flip(ur1j6(2:21)),ur1i6];
u2i6=[flip(ur2j6(2:21)),ur2i6];
u3i6=[flip(ur3j6(2:21)),ur3i6];



%% plot ROM data

figure(1)
plot(t1,u1a)
title('Part-2-1.LOADNODE ROM about x-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(2)
plot(t1,u2a)
title('Part-2-1.LOADNODE ROM about y-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(3)
plot(t1,u3a)
title('Part-2-1.LOADNODE ROM about z-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(4)
plot(t2,u1a5)
title('Part-2-1.LOADNODE ROM about x-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(5)
plot(t2,u2a5)
title('Part-2-1.LOADNODE ROM about y-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(6)
plot(t2,u3a5)
title('Part-2-1.LOADNODE ROM about z-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(7)
plot(tab6,u1a6)
title('Part-2-1.LOADNODE ROM about x-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('degrees')
hold on

figure(8)
plot(tab6,u2a6)
title('Part-2-1.LOADNODE ROM about y-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('degrees')
hold on

figure(9)
plot(tab6,u3a6)
title('Part-2-1.LOADNODE ROM about z-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('degrees')
hold on

figure(10)
plot(t3,u1z)
title('Part-2-1.N-C4-EP ROM about x-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on


figure(11)
plot(t3,u2z)
title('Part-2-1.N-C4-EP ROM about y-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
 hold on

figure(12)
plot(t3,u3z)
title('Part-2-1.N-C4-EP ROM about z-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(13)
plot(t4,u1z5)
title('Part-2-1.N-C4-EP ROM about x-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(14)
plot(t4,u2z5)
title('Part-2-1.N-C4-EP ROM about y-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(15)
plot(t4,u3z5)
title('Part-2-1.N-C4-EP ROM about z-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on


figure(16)
plot(t20,u1c6)
title('Part-2-1.N-C4-EP ROM about x axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(17)
plot(t20,u2c6)
title('Part-2-1.N-C4-EP ROM about y axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(18)
plot(t20,u3c6)
title('Part-2-1.N-C4-EP ROM about z axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(19)
plot(t5,u1y)
title('Part-2-1.N-C5-EP ROM about x-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(20)
plot(t5,u2y)
title('Part-2-1.N-C4-EP ROM about y-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(21)
plot(t5,u3y)
title('Part-2-1.N-C4-EP ROM about z-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(22)
plot(t6,u1y5)
title('Part-2-1.N-C5-EP ROM about x-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(23)
plot(t6,u2y5)
title('Part-2-1.N-C5-EP ROM about y-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(24)
plot(t6,u3y5)
title('Part-2-1.N-C5-EP ROM about z-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on


figure(25)
plot(t21,u1e6)
title('Part-2-1.N-C5-EP ROM about x-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(26)
plot(t21,u2e6)
title('Part-2-1.N-C5-EP ROM about y-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(27)
plot(t21,u3e6)
title('Part-2-1.N-C5-EP ROM about y-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(28)
plot(t7,u1x)
title('Part-2-1.N-C6-EP ROM about x-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(29)
plot(t7,u2x)
title('Part-2-1.N-C6-EP ROM about y-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(30)
plot(t7,u3x)
title('Part-2-1.N-C6-EP ROM about z-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on



figure(31)
plot(t8,u1x5)
title('Part-2-1.N-C6-EP ROM about x-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(32)
plot(t8,u2x5)
title('Part-2-1.N-C6-EP ROM about y-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(33)
plot(t8,u3x5)
title('Part-2-1.N-C6-EP ROM about z-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(34)
plot(t22,u1g6)
title('Part-2-1.N-C6-EP ROM about x-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(35)
plot(t22,u2g6)
title('Part-2-1.N-C6-EP ROM about y-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(36)
plot(t22,u3g6)
title('Part-2-1.N-C6-EP ROM about z-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(37)
plot(t9,u1w)
title('Part-2-1.N-C7-EP ROM about x-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(38)
plot(t9,u2w)
title('Part-2-1.N-C7-EP ROM about y-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(39)
plot(t9,u3w)
title('Part-2-1.N-C7-EP ROM about z-axis (4N&4P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on


figure(40)
plot(t10,u1x5)
title('Part-2-1.N-C7-EP ROM about x-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(41)
plot(t10,u2x5)
title('Part-2-1.N-C7-EP ROM about y-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(42)
plot(t10,u3x5)
title('Part-2-1.N-C7-EP ROM about z-axis (5N&5P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(43)
plot(t23,u1i6)
title('Part-2-1.N-C7-EP ROM about x-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(44)
plot(t23,u2i6)
title('Part-2-1.N-C7-EP ROM about y-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on

figure(45)
plot(t23,u3i6)
title('Part-2-1.N-C7-EP ROM about z-axis (6N&6P)')
xlabel('Moment N-m')
ylabel('Degrees')
hold on
