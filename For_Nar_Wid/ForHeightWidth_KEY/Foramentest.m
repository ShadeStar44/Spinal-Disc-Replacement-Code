%% Foramen Height Test
clear,clc
data = xlsread('Foramentest.xlsx','Foramentest');

w1 = 9.70641;
w2 = 444.062;
w3 = -707.068;

w12 = 10.3379;
w22 = 436.254;
w32 = -709.973;

ww1 =  15.2309;
ww2 =  449.794;
ww3 = -710.435;

ww12 = 15.7348;
ww22 = 443.346;
ww32 = -711.453;

widthun =sqrt((w1-ww1)^2+(ww2-w2)^2+(ww3-w3)^2);
widthdef = sqrt((ww12-ww12)^2+(ww22-w22)^2+(ww12-w12)^2);
changewidth = widthun-widthdef
percentwidth = changewidth/widthun*100

h1 = 12.8298;
h2 = 445.398;
h3 = -705.747;

h12 = 13.5034;
h22 = 437.118;
h32 = -708.386;
 
hh1 =  12.3763;
hh2 =  446.738;
hh3 = -714.659;

hh12 = 12.7858;
hh22 = 441.311;
hh32 = -716.197;

hun =sqrt((hh1-h1)^2+(hh2-h2)^2+(hh3-h3)^2);
hdef = sqrt((hh12-h12)^2+(hh22-h22)^2+(hh32-h32)^2);
changeh = hun-hdef
percenth = changeh/hun*100
