%% Height and width change in Foramen C4-5 left
clear,clc
% Width 1st reference node: 31500
x = 9.70641;
y = 444.062;
z = -707.068;
% Width 1st reference node after load: 31500
x1 = 10.3379;
y1 = 436.254;
z1 = -709.973;
% Width 2nd reference node: 37415
xx = 15.2309;
yy = 449.794 ;
zz =-710.435;
% Width 2nd reference node after load: 37415
xx1 = 15.7348;
yy1 = 443.346;
zz1 = -711.453;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2)
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2)
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 16177
hx = 12.8298;
hy = 445.398;
hz = -705.747;
% height 1st ref node loaded; 16177
hx1 = 13.5034;
hy1 = 437.118 ;
hz1 = -708.386;
% Height 2nd ref node: 36572
hxx = 12.3763;
hyy = 446.738 ;
hzz = -714.659;
% Height 2nd ref node loaded: 36572
hxx1 = 12.7858;
hyy1 = 441.311;
hzz1 = -716.197;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2)
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2)
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100



