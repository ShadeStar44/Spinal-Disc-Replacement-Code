%% Attempt at using function from paper

clear,clc
% Import Data
data = xlsread('C4ref2.xlsx','C4ref2');
P1 = data(1,3:4)+data(1,10:11);
P12 = P1 +data(2,10:11);
P2 = data(22,3:4)+data(22,10:11);
P22 = P2+data(23,10:11);
P3 = data(43,3:4)+data(43,10:11);
P32 = P3+data(44,10:11);

E = [P1;P2;P3];
F = [P12;P22;P32];
[fcr, theta, scale] = calcFCRTheta(E, F)
