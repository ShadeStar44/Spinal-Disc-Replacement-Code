%% Height and width change in Foramen C3-4 Right on the Intact_6P model
clear,clc
% Width 1st reference node: 9037
x = -7.50723e+00; y = 4.44719e+02; z = -6.90512e+02;
% Width 1st reference node after load
x1 = -1.17825e+01;  y1 = 4.46159e+02; z1 = -6.93016e+02;
% Width 2nd reference node: 21922
xx = -1.29198e+01; yy= 4.50785e+02; zz = -6.94998e+02;
% Width 2nd reference node after load: 
xx1 = -1.51902e+01; yy1 = 4.52670e+02; zz1 = -6.97213e+02;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2)
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2)
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 4295
hx =  -1.20026e+01; hy = 4.48120e+02; hz = -6.88884e+02;
% height 1st ref node loaded:
hx1 =  -1.54297e+01; hy1 = 4.50614e+02; hz1 = -6.91907e+02;
% Height 2nd ref node: 16362
hxx = -1.13686e+01; hyy = 4.47846e+02; hzz = -6.98865e+02;
% Height 2nd ref node loaded: 20102
hxx1 = -1.38376e+01;  hyy1 = 4.49530e+02; hzz1 = -7.01000e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2)
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2)
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100