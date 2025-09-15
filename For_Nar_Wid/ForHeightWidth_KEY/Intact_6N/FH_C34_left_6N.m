%% Height and width change in Foramen C3-4 Left on the Intact_6P model
clear,clc
% Width 1st reference node: 14886
x = 9.91704e+00;  y = 4.44847e+02; z = -6.91954e+02;
% Width 1st reference node after load
x1 = 5.03556e+00; y1 = 4.41577e+02; z1 = -6.91658e+02;
% Width 2nd reference node: 17116
xx = 1.62684e+01;  yy = 4.49981e+02; zz =  -6.96273e+02;
% Width 2nd reference node after load: 
xx1 = 1.31034e+01;  yy1 = 4.45579e+02; zz1 =  -6.95179e+02;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2);
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2);
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 1223
hx =  1.36903e+01; hy = 4.46629e+02; hz = -6.90105e+02;
% height 1st ref node loaded:
hx1 =  8.77603e+00; hy1 = 4.42238e+02; hz1 = -6.89120e+02;
% Height 2nd ref node: 16362
hxx = 1.41541e+01; hyy = 4.46407e+02; hzz =-6.99116e+02;
% Height 2nd ref node loaded: 
hxx1 = 1.06404e+01;  hyy1 = 4.42614e+02; hzz1 = -6.98408e+02;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2);
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2);
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100