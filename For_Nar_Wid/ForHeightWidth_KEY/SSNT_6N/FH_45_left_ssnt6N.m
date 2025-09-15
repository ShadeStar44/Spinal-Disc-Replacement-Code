%% Height and width change in Foramen C4-5 left SS_NT_6P
clear,clc
% Width 1st reference node: 31500
x = 9.70641;
y = 444.062;
z = -707.068;
% Width 1st reference node after load: 31500
x1 = 6.28101e+00; y1= 4.40523e+02; z1 = -7.07056e+02;
% Width 2nd reference node: 37415
xx = 15.2309;
yy = 449.794 ;
zz =-710.435;
% Width 2nd reference node after load: 37415
xx1 = 1.35947e+01; yy1 = 4.46417e+02; zz1 = -7.09984e+02;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2);
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2);
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
hx1 =  9.41464e+00; hy1 = 4.41000e+02; hz1 = -7.05245e+02;
% Height 2nd ref node: 36572
hxx = 12.3763;
hyy = 446.738 ;
hzz = -714.659;
% Height 2nd ref node loaded: 36572
hxx1 = 1.06975e+01; hyy1 = 4.44066e+02; hzz1 = -7.14598e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2);
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2);
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100