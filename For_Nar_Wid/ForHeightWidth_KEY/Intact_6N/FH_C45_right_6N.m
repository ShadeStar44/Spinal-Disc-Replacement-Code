%% Height and width change in Foramen C4-5 right Intact_6P model
clear,clc
% Width 1st reference node: 25653
x = -8.75494;
y = 444.966;
z = -706.296;
% Width 1st reference node after load: 25653
x1 = -1.10152e+01; y1 = 4.46294e+02; z1 = -7.08205e+02;
% Width 2nd reference node: 41577
xx =-1.61221e+01; yy = 4.47232e+02; zz = -7.09586e+02;
% Width 2nd reference node after load: 41577
xx1 = -1.77305e+01; yy1 = 4.49280e+02; zz1 = -7.11571e+02;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2)
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2)
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 20210
hx = -11.4736;
hy = 445.549;
hz = -705.033;
% height 1st ref node loaded; 20210
hx1 =  -1.36802e+01; hy1 = 4.47424e+02; hz1 = -7.07235e+02;
% Height 2nd ref node: 40227
hxx = -1.29060e+01; hyy = 4.47006e+02; hzz = -7.14769e+02;
% Height 2nd ref node loaded: 40227
hxx1 = -1.41431e+01;  hyy1 = 4.48652e+02; hzz1 = -7.16476e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2)
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2)
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100