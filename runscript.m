%% runs all models for facet contact force magnitude
% and produces all figures and subplots
close all
clear variables
%% intact 
% 6n6p

run('E:\results\CFNM\intact\intact_6P_6N.m')
figure(30)
subplot(3,3,1)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right

c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for intact under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

% 5n5p 
run('E:\results\CFNM\intact\intact_5P_5N.m')
figure(31)
subplot(3,3,1)

% Left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right

c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for intact under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

% 4n4p
run('E:\results\CFNM\intact\intact_4P_4N.m')
figure(32)
subplot(3,3,1)
% left

c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right

c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for intact under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','northeast')
%% model 1
%6n6p
run('E:\results\CFNM\model1\model1_6N6P.m')
figure(30)
subplot(3,3,2)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right

c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 1 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','northwest')

%5n5p
run('E:\results\CFNM\model1\model1_5N5P.m')
figure(31)
subplot(3,3,2)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right

c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 1 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model1\model1_4N4P.m')
figure(32)
subplot(3,3,2)

%left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on

% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 1 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','northwest')
%% model 2
%6n6p
run('E:\results\CFNM\model2\model2_6N6P.m')
figure(30)
subplot(3,3,3)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 2 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%5n5p
run('E:\results\CFNM\model2\model2_5N5P.m')
figure(31)
subplot(3,3,3)


% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) model 2 under lateral bending 5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model2\model2_4N4P.m')
figure(32)
subplot(3,3,3)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on

% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) model 2 under extension/flexion(4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','northwest')
%% model 3
%6n6p
run('E:\results\CFNM\model3\model3_6N6P.m')
figure(30)
subplot(3,3,4)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on

% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 3 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%5n5p
run('E:\results\CFNM\model3\model3_5N5P.m')
figure(31)
subplot(3,3,4)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 3  under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model3\model3_4N4P.m')
figure(32)
subplot(3,3,4)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on

% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 3 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')
%% model 4
%6n6p
run('E:\results\CFNM\model4\model4_6N6P.m')
figure(30)
subplot(3,3,5)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on

% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for intact under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%5n5p
run('E:\results\CFNM\model4\model4_5N5P.m')
figure(31)
subplot(3,3,5)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on

% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 4 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model4\model4_4N4P.m')
figure(32)
subplot(3,3,5)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 4 under extension/flexion(4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')


%% model 5
%6n6p
run('E:\results\CFNM\model5\model5_6n6p.m')
figure(30)
subplot(3,3,6)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 5 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%5n5p
run('E:\results\CFNM\model5\model5_5n5p.m')
figure(31)
subplot(3,3,6)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 5 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model5\model5_4n4p.m')
figure(32)
subplot(3,3,6)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 5 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%% model 6
%6n6p
run('E:\results\CFNM\model6\model6_6n6p.m')
figure(30)
subplot(3,3,7)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 6 under extension/flexion (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%5n5p
run('E:\results\CFNM\model6\model6_5n5p.m')
figure(31)
subplot(3,3,7)

% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 6 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model6\model6_4n4p.m')
figure(32)
subplot(3,3,7)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 6 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')



%% model 13
%6n6p
run('E:\results\CFNM\model13\model13_6n6p.m')
figure(30)
subplot(3,3,8)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 13 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

run('E:\results\CFNM\model13\model13_5n5p.m')
figure(31)
subplot(3,3,8)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 13 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

run('E:\results\CFNM\model13\model13_4n4p.m')
figure(32)
subplot(3,3,8)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 13 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%% model 14
%6n6p
run('E:\results\CFNM\model14\model14_6n6p.m')
figure(30)
subplot(3,3,9)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 14 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%5n5p
run('E:\results\CFNM\model14\model14_5n5p.m')
figure(31)
subplot(3,3,9)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 14 lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

%4n4p
run('E:\results\CFNM\model14\model14_4n4p.m')
figure(32)
subplot(3,3,9)
% left
c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
c4yl=[flip(c4ulyn(2:21)),c4ulyp];
a=plot(c4xl,c4yl,'r');
hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
c6yl=[flip(c6ulyn(2:21)),c6ulyp];
c=plot(c6xl,c6yl,'b');
hold on

c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
c7yl=[flip(c7ulyn(2:21)),c7ulyp];
d=plot(c7xl,c7yl,'c');
hold on
% Right
c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'color',[0.2 0 0]);
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 14 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')

figure(30)
figure(31)
figure(32)







