%% runscript
clear variables
close all
%% 6n6p
%% intact
run('F:\results\CAREA\intact\intact_6n6p.m')
figure(50)
subplot(3,3,1)

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
title('Facet Contact Area (CAREA) for intact model under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 1
run('F:\results\CAREA\model1\model1_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 1 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 2
run('F:\results\CAREA\model2\model2_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 2 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 3
run('F:\results\CAREA\model3\model3_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 3 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 4
run('F:\results\CAREA\model4\model4_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 4 axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 5
run('F:\results\CAREA\model5\model_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 5 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 6
run('F:\results\CAREA\model6\model6_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 6 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 13
run('F:\results\CAREA\model13\model13_6n6p.m')
figure(50)
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
title('Facet Contact Area (CAREA) for model 13 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 14
run('F:\results\CAREA\model14\model14_6n6p.m')
figure(50)
subplot(3,3,9)

%6n6p
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
%6n6p
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
title('Facet Contact Area (CAREA) for model 14 under axial rotation (6N/6P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')


%% 5n5p
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% intact
run('F:\results\CAREA\intact\intact_5n5p.m')
figure(51)
subplot(3,3,1)

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
title('Facet Contact Area (CAREA) for intact model under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 1
run('F:\results\CAREA\model1\model1_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 1 under lateral bending(5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 2
run('F:\results\CAREA\model2\model2_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 2 lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 3
run('F:\results\CAREA\model3\model3_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 3 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 4
run('F:\results\CAREA\model4\model4_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 4 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 5
run('F:\results\CAREA\model5\model5_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 5 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 6
run('F:\results\CAREA\model6\model6_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 6 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 13
run('F:\results\CAREA\model13\model13_5n5p.m')
figure(51)
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
title('Facet Contact Area (CAREA) for model 13 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 14
run('F:\results\CAREA\model14\model14_5n5p.m')
figure(51)
subplot(3,3,9)

%6n6p
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
%6n6p
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
title('Facet Contact Area (CAREA) for model 14 under lateral bending (5N/5P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4n4p
%% intact
run('F:\results\CAREA\intact\intact_4n4p.m')
figure(52)
subplot(3,3,1)

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
title('Facet Contact Area (CAREA) for intact model under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 1
run('F:\results\CAREA\model1\model1_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 1 under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 2
run('F:\results\CAREA\model2\model2_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 2 under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 3
run('F:\results\CAREA\model3\model3_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 3 under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 4
run('F:\results\CAREA\model4\model4_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 4 flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 5
run('E:\results\CAREA\model5\model5_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 5 under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')
%% model 6
run('E:\results\CAREA\model6\model6_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 6 under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 13
run('E:\results\CAREA\model13\model13_4n4p.m')
figure(52)
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
title('Facet Contact Area (CAREA) for model 13 under flexion/extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')

%% model 14
run('E:\results\CAREA\model14\model14_4n4p.m')
figure(52)
subplot(3,3,9)

%6n6p
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
%6n6p
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
title('Facet Contact Area (CAREA) for model 14 under flexion/Extension (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Area (mm^2)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','south')


