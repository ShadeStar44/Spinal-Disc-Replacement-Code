%% Helical Axis Attempt 1
% Christopher Key
% 07/28/2020
clear,clc
% Step 1 Import data from abaqus
data = xlsread('C4_refno.xlsx','C4_refno');
data1 = xlsread('C5_refno.xlsx','C5_refno');
% Coords for lower anterior ref node: 27602
la4  = data(2,2:4)+data(2,9:11);
% Coors for upper anterior ref node: [27972]
ua4 = data(23,2:4)+data(23,9:11);
% Coors for lower post ref node: [29044]
lp4 = data(44,2:4)+data(44,9:11);

it4 = -la4+lp4;
%Unit Vector of C4 x axis
i4 = it4/sqrt(it4(1)^2+it4(2)^2+it4(3)^2);
%Unit Vector of C4 z axis
kt4 = ua4-la4;
the4 = cross(kt4,i4);
mag4 = sqrt(the4(1)^2+the4(2)^2+the4(3)^2);
k4 = the4/mag4;
%Unit Vector of C4 y axis
j4 = cross(k4,i4);
%Transformation from C4 ref frame to global ref frame
%v = la4./sqrt(la4(1)^2+la4(2)^2+la4(3)^2);
vxp1 = i4;
vyp = j4;
vzp = k4;

T4 = [vxp1;vyp;vzp];
 
%Coors for C5 lower anterior ref node:[48025]
la5 = data1(2,2:4)+data1(2,9:11);
%Coors for C5 upper anterior  ref node: [48403]
ua5 = data1(23,2:4)+data1(23,9:11);
%Coors for C5 lower posterior ref node: [49541]
lp5 = data1(44,2:4)+data1(44,9:11);

%Unit vector of c5 x axis
it5 = lp5-la5;
i5 = it5/sqrt(it5(1)^2+it5(2)^2+it5(3)^2);
%Unit vector of c5 z axis
kt5 = ua5-la5;
the5 = cross(kt5,i5);
mag5 = sqrt(the5(1)^2+the5(2)^2+the5(3)^2);
k5 = the5/mag5;
%Unit vector of c5 y axis
j5 = cross(k5,i5);

%Transformation from C5 ref frame to global ref frame
%v5 = la5./sqrt(la5(1)^2+la5(2)^2+la5(3)^2);
vxp5 = i5;
vyp5 = j5;
vzp5 = k5;
T5 = [vxp5;vyp5;vzp5]

%C4 with respect to C5 ref frames
T45 = (T4)*T5.';

% angle theta
 thej = asin(T45(3,1));
% Now findind the next two angles of the rotation matrix
 check = T45(3,3)*cos(thej);
phij = atan(-T45(3,2)/T45(3,3));
check2 = T45(1,1)*cos(thej);
trij = atan(-T45(2,1)/T45(1,1));

%% Transformation matrix from c5 to global for time step 2
%Coors for C5 lower anterior ref node:[48025]
la52 = data1(3,2:4)+data1(3,9:11);
%Coors for C5 upper anterior  ref node: [48403]
ua52 = data1(24,2:4)+data1(24,9:11);
%Coors for C5 lower posterior ref node: [49541]
lp52 = data1(45,2:4)+data1(45,9:11);

%Unit vector of c5 x axis
it52 = lp52-la52;
i52 = it52/sqrt(it52(1)^2+it52(2)^2+it52(3)^2);
%Unit vector of c5 z axis
kt52 = ua52-la52;
the52 = cross(kt52,i52);
mag52 = sqrt(the52(1)^2+the52(2)^2+the52(3)^2);
k52 = the52/mag52;
%Unit vector of c5 y axis
j52 = cross(k52,i52);

%Transformation from C5 ref frame to global ref frame
%v5 = la5./sqrt(la5(1)^2+la5(2)^2+la5(3)^2);
vxp52 = i52;
vyp52 = j52;
vzp52 = k52;
T52 = [vxp52;vyp52;vzp52]


%% Rotation matrix
% Global Position of Orgin (la5) at time step 1 and 2
GPo1 = la5;
GPo2 = data1(3,2:4)+data1(3,9:11);

% Global Position of markers on C4 vertebrea at time steps 1 and 2
GP41 = [la4;ua4;lp4];

% Coords for lower anterior ref node: 27602 @ time step 2
la42  = data(3,2:4)+data(3,9:11);
% Coors for upper anterior ref node: [27972] @ time step 2
ua42 = data(24,2:4)+data(24,9:11);
% Coors for lower post ref node: [29044] @ time step 2
lp42 = data(45,2:4)+data(45,9:11);
GP42 = [la42;ua42;lp42];

x1i = T5*(GP41-GPo1)
x2i = T52*(GP42-GPo2)

% Mean coordinate point for frames 1 and 2
stuff1 = mean([lp4(1) la4(1) ua4(1)]);
stuff2 = mean([lp4(2) la4(2) ua4(2)]);
stuff3 = mean([lp4(3) la4(3) ua4(3)]);

what1 = mean([lp42(1) la42(1) ua42(1)]);
what2 = mean([lp42(2) la42(2) ua42(2)]);
what3 = mean([lp42(3) la42(3) ua42(3)]);


the = [x1i(:,1)-stuff1 x1i(:,2)-stuff2 x1i(:,3)-stuff3]
the1 = [x2i(:,1)-what1 x2i(:,2)-what2 x2i(:,3)-what3]
% xmen = mean(x1i(:,1))
% ymen = mean(x1i(:,2))
% zmen = mean(x1i(:,3))

% x_ij1 = [lp4(1)-xmen;la4(1)-xmen]





R = T45.'

angle = acos((trace(R)-1)/2)

nmat = 1/2*(R+R.')-cos(angle)*[1 0 0;0 1 0;0 0 1]

N1 = nmat(:,1);
N1mag = sqrt(N1(1)^2+N1(2)^2+N1(3)^2)

N2 = nmat(:,2);
N2mag = sqrt(N2(1)^2+N2(2)^2+N2(3)^2)

N3 = nmat(:,3);
N3mag = sqrt(N3(1)^2+N3(2)^2+N3(3)^2)

N = N2/ (N2mag)

n = [0 -N(3) N(2); N(3) 0 -N(1); -N(2) N(1) 0]

