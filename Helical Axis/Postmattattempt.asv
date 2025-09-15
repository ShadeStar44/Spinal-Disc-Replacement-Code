% Post Matt Attempt


clear,clc


data = xlsread('C4_refno.xlsx','C4_refno');
data1 = xlsread('C5_refno.xlsx','C5_refno');

% Coords for lower anterior ref node: 27602
a1  = data(2,2:4)+data(2,9:11);
% Coors for upper anterior ref node: [27972]
a2 = data(23,2:4)+data(23,9:11);
% Coors for lower post ref node: [29044]
a3 = data(44,2:4)+data(44,9:11);


p1 = a1+(data(1,9:11));
p2 = a2+(data(22,9:11));
p3 = a1+(data(43,9:11));


ai = [a1 a2 a3]
pi = [p1 p2 p3]

a = 1/3*(a1+a2+a3)
p = 1/3*(p1+p2+p3)

it = p1.*a1.'
it1 = p2.*a2.'
it2 = p3.*a3.'
stuff = p.*a.'

M = 1/3.*(it-stuff)+(it1-stuff)+(it2-stuff)

Melon = M.'.*M

[V,D] = eig(Melon)

% D1 = [D(3) 0 0;0 D(2) 0; 0 0 D(1)]
V1 = [V(:,3) V(:,2) V(:,1)]
lil_ms = M.*V1

R1 = (1/D(3,3)*lil_ms(1,:)).'
R2 = (1/D(2,2)*lil_ms(2,:)).'
R3 = (1/(D(3,3).*D(2,2)))*cross(lil_ms(:,1),lil_ms(:,2))

R =  [R1 R2 R3].*V1.'

v = (p - R.*a).'

q = R.*a1+v