%% Attempt 4
% Christopher Key
% 08/05/2020
clear,clc

% Import data of C4 
data = xlsread('C4_refno.xlsx','C4_refno');

a1 = data(1,2:4);
a2 = data(22,2:4);
a3 = data(43,2:4);

p1 = a1+(data(1,9:11));
p2 = a2+(data(22,9:11));
p3 = a1+(data(43,9:11));

ai = [a1 a2 a3]
pi = [p1 p2 p3]

a = 1/3*sum(ai)
p = 1/3*sum(pi)

it = 1/3*sum((p1*a1.')-(p*a.'))
it1 = 1/3*sum((p2*a2.')-(p*a.'))
it2 = 1/3*sum((p3*a3.')-(p*a.'))
M = [it it1 it2]







