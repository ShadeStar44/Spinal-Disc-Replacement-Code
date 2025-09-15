%% This will test how sensitive the choice of reference nodes 

% Height and width change in Foramen C4-5 right
clear,clc
% Width 1st reference node: 
x = -9.60606;  
y = 442.120;
z = -706.279;
% Width 1st reference node after load: 25653
x1 = -8.91043;  y1 = 433.740; z1 = -709.206;

% Width 2nd reference node: 41577
xx =  -18.8464;   
yy = 446.931;
zz = -707.544;
% Width 2nd reference node after load: 41577
xx1 = -18.2661;  
yy1 = 439.672;
zz1 = -708.522;
% Unloaded width
w = sqrt((xx-x)^2+(yy-y)^2+(zz-z)^2)
% Loaded width
w1 = sqrt((xx1-x1)^2+(yy1-y1)^2+(zz1-z1)^2)
% Change in width
change = abs(w-w1)
% Percent change in width
pchange = change/w*100

%% Height change
% height 1st reference node: 19224
hx = -14.8501;   
hy = 439.099;
hz = -702.282;
% height 1st ref node loaded; 19224
hx1 = -13.9608;
hy1 = 429.412;
hz1 = -706.310;
% Height 2nd ref node: 40228
hxx = -13.7307;   
hyy = 447.867 ;
hzz = -714.614;
% Height 2nd ref node loaded: 40228
hxx1 = -13.3152;  
hyy1 = 442.224;
hzz1 = -715.306;
% Unloaded height
h = sqrt((hxx-hx)^2+(hyy-hy)^2+(hzz-hz)^2)
% Loaded width
h1 = sqrt((hxx1-hx1)^2+(hyy1-hy1)^2+(hzz1-hz1)^2)
% Change in width
changeh = abs(h-h1)
% Percent change in width
pchangeh = changeh/h*100