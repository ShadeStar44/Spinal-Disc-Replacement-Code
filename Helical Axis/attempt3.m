%% This is attempt #3 for finding the helial axis of rotation for C4-5
% Chris Key
% 08/04/2020
clear,clc
% First import the data from ref nodeds on C4 and C5
data = xlsread('C4_refno.xlsx','C4_refno');
data1 = xlsread('C5_refno.xlsx','C5_refno');
% Now attempt to shift the global reference frame to a ref node on C5
la5 = data1(2,2:4);
ua5 = data1(23,2:4);
lp5 = data1(44,2:4);
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

% Transformation matrix from C5 to global
T5G = [i5;j5;k5]

la4  = data(2,2:4);
% Coors for upper anterior ref node: [27972]
ua4 = data(23,2:4);
% Coors for lower post ref node: [29044]
lp4 = data(44,2:4);

% Position Vector for ref nodes on C4 transformed into the C5 reference
% frame
la4p = T5G.*la4'
ua4p = T5G.*ua4'
lp4p = T5G.*lp4'





