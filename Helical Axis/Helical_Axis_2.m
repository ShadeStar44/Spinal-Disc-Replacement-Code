% Post Matt Attempt

clear,clc
% Import Data from Excel Files
% Data is sorted by node reference number (column 1: smallest to largest) with the
% corresponding x,y,z displacements (columns 9-11). Columns 2-4 are the
% original coordinates of the ref node.
data = xlsread('C4ref2.xlsx','C4ref2');

% Coords for lower anterior ref node: 
a1  = 100+(data(1,2:4)+data(1,9:11)).';
% Coors for upper anterior ref node: 
a2 = 100+(data(22,2:4)+data(22,9:11)).';
% Coors for lower post ref node: 
a3 = 100+(data(43,2:4)+data(43,9:11)).';

% Coords for Pees
p1 = 100+(a1 + data(2,9:11)');
p2 = 100+(a2 + data(23,9:11)');
p3 = 100+(a3 + data(44,9:11)');

% Average xyz postiions of nodes before and after movement
a = 1/3*(a1+a2+a3)  ;           %1x3
p = 1/3*(p1+p2+p3)  ;           %1x3

% Setup to get M matrix
M1 = p1.*a1.';
M2 = p2.*a2.';
M3 = p3.*a3.';
M4 = p.*a.';
% M matrix
M = (1/3*((M1)+(M2)+(M3)))-M4    %3x3

Melon = M'*M % melons also might be the crux

[V,D] = eig(Melon)

Vswitch = [V(:,3) V(:,2) V(:,1)]
Dflip = flip(flip(D,2))             %3x3
lil_ms = M*Vswitch      ;        %3x3

R1 = (1/Dflip(1,1)*lil_ms(:,1));
R2 = (1/Dflip(2,2)*lil_ms(:,2));
R3 = (1/(Dflip(1,1)*Dflip(2,2)))*cross(lil_ms(:,1),lil_ms(:,2));
Rs = [R1 R2 R3];
% Why is third column zeros? 
% All R have a det of one, so whats going on?

R = Rs*Vswitch.'    %this must be cross product for dimensions to work out
% 
v = (p - R*a).'
q = R.*a1+v
