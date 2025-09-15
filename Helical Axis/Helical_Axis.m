% Post Matt Attempt

clear,clc
% Import Data from Excel Files
% Data is sorted by node reference number (column 1: smallest to largest) with the
% corresponding x,y,z displacements (columns 9-11). Columns 2-4 are the
% original coordinates of the ref node.
data = xlsread('C4_refno.xlsx','C4_refno');
data1 = xlsread('C5_refno.xlsx','C5_refno');

% Coords for Ref Nodes Before Movement (Eq(4) from paper)
a1  = data(1,2:4)+data(1,9:11);
a2 = data(23,2:4)+data(23,9:11);
a3 = data(44,2:4)+data(44,9:11);

% Coords for Nodes after movement (Eq(4) from paper)
p1 = a1+(data(1,9:11));             %1x3
p2 = a2+(data(22,9:11));            %1x3
p3 = a1+(data(43,9:11));            %1x3

ai = [a1; a2; a3]     ;               %3x3 
pi = [p1; p2; p3]   ;                 %3x3

% Equation (4) average position of markers before(a) and after(p) movement
a = 1/3*(a1+a2+a3)     ;             %1x3
p = 1/3*(p1+p2+p3)    ;              %1x3

% Equation (5) 'M' matrix
M1 = p1.*a1';
M2 = p2.*a2';
M3 = p3.*a3';
M4 = p.*a';
M = 1/3.*((M1-M4)+(M2-M4)+(M3-M4))    %3x3

% Equation (13) M*transpose(M)
Melon = M'.*M  %3x3

% This is an attempt to sort the eigenvalues (D_11,D_22,D_33) in order of
% largest to smallest on the princpal diagonal
Melonf = flip(flip(Melon,2))

% mel = sqrt(diag(Melon)) these may verify the eigen values are correct?

% Eigen Values and Vetors using eig function
[V,D] = eig(Melon)

% These flips are again attempting to keep the correct order 
Vflip = flip(flip(V,2))            %3x3   we used flip!
Dflip = flip(flip(D,2))             %3x3

% Equation (23) (m1, m2, m3)
lil_ms = M.*Vflip             ;      %3x3

% Eq (24) setup to find Rotation matrix
R1 = (1/Dflip(1,1)*lil_ms(1,:)).';
R2 = (1/Dflip(2,2)*lil_ms(2,:)).';
R3 = (1/(Dflip(1,1).*Dflip(2,2)))*cross(lil_ms(:,1),lil_ms(:,2));
% Rotation Matrix (R)
R =  [R1 R2 R3].*Vflip.'     ;       %3x3
% Eq(10) Translation Vetor 
v = (p - R.*a).'  ;          %3x3 WRONGGG (needs to be 1x3)

% Verifiation that R and v are correct. If correct, q_i should equal p_i
q = R.*a1+v       ;                  %3x3

%% NEW STUFF!!

% Eq(3) funcitons to minimize
f1 = (1/3).*((R.*a1+v-p1).'.*(R.*a1+v-p1));
f2 = (1/3).*((R.*a2+v-p2).'.*(R.*a2+v-p2));
f3 = (1/3).*((R.*a3+v-p3).'.*(R.*a3+v-p3));

% Sum of f's
f = f1+f2+f3    ;                    %3x3

% Eq(32) Rotation angle 
phi = asin(sqrt((R(3,2)-R(2,3))^2+(R(1,3)-R(3,1))^2+(R(2,1)-R(1,2))^2)*(1/2));

% These verify that we are totally wrong
% t = sqrt(v.'*v)   ;          % WRONGGG
% n = (t^(-1))*v    ;          % What??? WRONGGG
% T = n'*v          ;          %Check T=t (but not really)

