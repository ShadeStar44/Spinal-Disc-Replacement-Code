%% Height and width change in Foramen C5-6 left Intact_6N
clear,clc
% Width 1st reference node: 52254
x = 9.04138e+00;  y = 4.45569e+02; z = -7.23432e+02;
% Width 1st reference node after load:
x1 =  7.99406e+00; y1 = 4.44026e+02; z1 = -7.23356e+02;
% Width 2nd reference node: 58362
xx =  1.47570e+01; yy = 4.51003e+02; zz = -7.26596e+02;
% Width 2nd reference node after load: 
xx1 = 1.42737e+01; yy1 = 4.49508e+02; zz1 = -7.26204e+02;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2);
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2);
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 36599
hx = 1.44289e+01; hy = 4.46902e+02; hz = -7.21918e+02;
% height 1st ref node loaded; 
hx1 = 1.33720e+01; hy1 = 4.44486e+02; hz1 = -7.21359e+02;
% Height 2nd ref node: 57521
hxx = 1.15272e+01;  hyy = 4.48460e+02; hzz = -7.30793e+02;
% Height 2nd ref node loaded:
hxx1 = 1.10584e+01; hyy1 = 4.47338e+02; hzz1 = -7.30604e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2);
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2);
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100