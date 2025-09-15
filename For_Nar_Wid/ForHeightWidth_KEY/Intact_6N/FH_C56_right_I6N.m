%% Height and width change in Foramen C5-6 right Intact_6N model
clear,clc
% Width 1st reference node: 45870
x = -9.75965e+00;  y =4.45175e+02; z = -7.23489e+02;
% Width 1st reference node after load: 
x1 = -1.05729e+01;  y1 = 4.46536e+02; z1 = -7.24964e+02;
% Width 2nd reference node: 64913
xx =-1.70499e+01;  yy = 4.47852e+02; zz = -7.25803e+02;
% Width 2nd reference node after load: 
xx1 = -1.76798e+01; yy1 = 4.48840e+02; zz1 = -7.26845e+02;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2)
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2)
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 40139
hx = -1.39525e+01; hy = 4.46494e+02; hz = -7.20978e+02;
% height 1st ref node loaded; 20210
hx1 =  -1.47135e+01;  hy1 = 4.48434e+02; hz1 = -7.22764e+02;
% Height 2nd ref node: 40227
hxx = -1.35397e+01;  hyy = 4.48593e+02; hzz = -7.30720e+02;
% Height 2nd ref node loaded: 40227
hxx1 = -1.39039e+01; hyy1 = 4.49408e+02; hzz1 = -7.31589e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2)
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2)
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100