%% This will attempt to calculate the IHA between two vertebrea
% Christopher Key
% 8/11/2020
clear,clc
% Import Data from Excel Files
% Data is sorted by node reference number (column 1: smallest to largest) with the
% corresponding x,y,z displacements (columns 9-11). Columns 2-4 are the
% original coordinates of the ref node.
data = xlsread('C4ref2.xlsx','C4ref2');
% Ref. node positions before movement
a1 = data(1,2:4)+data(1,9:11);
a2 = data(22,2:4)+data(22,9:11);
a3 = data(43,2:4)+data(43,9:11);
% Ref. node positions after movement
p1 = a1 + data(2,9:11);
p2 = a2 + data(23,9:11);
p3 = a3 + data(44,9:11);
% Average positions before(a) and after(p) movement
a = 1/3*(a1+a2+a3);
p = 1/3*(p1+p2+p3);
% Finding matrix M
M1 = p1.*a1';
M2 = p2.*a2';
M3 = p3.*a3';
M4 = p.*a';
M = 1/3.*((M1-M4)+(M2-M4)+(M3-M4));
%M'M 
Melon = M'*M;
%Eigen values and vectors 
[V,D] = eig(Melon);
%Flip D to get the eigen values in the correct order
Dflip = flip(flip(D,2));
Vflip = flip(flip(V,2));
% If eigen vectors should have order swithced instead of fliped
Vswap = [V(:,3) V(:,2) V(:,1)]










