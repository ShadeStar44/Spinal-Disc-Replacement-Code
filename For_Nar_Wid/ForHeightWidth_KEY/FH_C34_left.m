%% Height and width change in Foramen C3-4 Left
clear,clc
% Width 1st reference node: 14886
x = 9.91704;  y = 444.847; z = -691.954;
% Width 1st reference node after load
x1 = 11.2018; y1 = 431.233; z1 = -696.273;
% Width 2nd reference node: 17116
xx =  16.2684; yy = 449.981; zz = -696.273;
% Width 2nd reference node after load: 
xx1 = 17.2902; yy1 = 438.239; zz1 = -698.041;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2)
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2)
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 1223
hx = 1.36903e+01; hy = 4.46629e+02; hz = -6.90105e+02;
% height 1st ref node loaded:
hx1 = 1.50499e+01; hy1 = 4.32058e+02; hz1 = -6.93969e+02;
% Height 2nd ref node: 16362
hxx = 1.41541e+01; hyy = 4.46407e+02; hzz = -6.99116e+02;
% Height 2nd ref node loaded: 40228
hxx1 = 1.50909e+01; hyy1 = 4.35813e+02; hzz1 = -7.01865e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2)
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2)
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100