%% runs all models for facet contact force magnitude
% and produces all figures and subplots
close all
clear variables
%% intact 
% 6n6p

run('E:\results\CFNM\intact\intact_6P_6N.m')
figure(30)
subplot(1,3,1)

% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on
% Right

% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);
grid on
grid minor
leg=[b,f];
title('intact')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

% 5n5p 
run('E:\results\CFNM\intact\intact_5P_5N.m')
figure(31)
subplot(1,3,1)

% Left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on
% Right
% 
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);
grid on
grid minor
leg=[b,f];
title('intact')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

% 4n4p
run('E:\results\CFNM\intact\intact_4P_4N.m')
figure(32)
subplot(1,3,1)
% left

% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on
% Right
% 
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);
grid on
grid minor
leg=[b,f];
title('intact')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','northeast')

%% model 4
%6n6p
run('E:\results\CFNM\model4\model4_6N6P.m')
figure(30)
subplot(1,3,2)
% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on

% Right
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);
grid on
grid minor
leg=[b,f];
title({'Facet Contact Force Magntiude (CFNM) under axial rotation (6N/6P)';'model 4'})
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

%5n5p
run('E:\results\CFNM\model4\model4_5N5P.m')
figure(31)
subplot(1,3,2)
% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on

% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on

% Right
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on

% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on

% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);
grid on
grid minor
leg=[b,f];
title({'Facet Contact Force Magntiude (CFNM) under lateral bending (5N/5P)';'model 4'})
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

%4n4p
run('E:\results\CFNM\model4\model4_4N4P.m')
figure(32)
subplot(1,3,2)

% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on
% Right
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on
grid on
grid minor
% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[b,f];
title({'Facet Contact Force Magntiude (CFNM) under extension/flexion(4N/4P)';'model 4'})
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')


%% model 14
%6n6p
run('E:\results\CFNM\model14\model14_6n6p.m')
figure(30)
subplot(1,3,3)
% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on
% 
% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on

% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
hold on
% Right
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on
grid on
grid minor
% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[b,f];
title('model 14')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

%5n5p
run('E:\results\CFNM\model14\model14_5n5p.m')
figure(31)
subplot(1,3,3)
% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on
% % Right
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on
grid on
grid minor
% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[b,f];
title('model 14')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

%4n4p
run('E:\results\CFNM\model14\model14_4n4p.m')
figure(32)
subplot(1,3,3)
% left
% c4xl=2*[flip(c4ulxn(2:21)),c4ulxp];
% c4yl=[flip(c4ulyn(2:21)),c4ulyp];
% a=plot(c4xl,c4yl,'r');
% hold on

c5xl=2*[flip(c5ulxn(2:21)),c5ulxp];
c5yl=[flip(c5ulyn(2:21)),c5ulyp];
b=plot(c5xl,c5yl,'g');
hold on

% c6xl=2*[flip(c6ulxn(2:21)),c6ulxp];
% c6yl=[flip(c6ulyn(2:21)),c6ulyp];
% c=plot(c6xl,c6yl,'b');
% hold on
% 
% c7xl=2*[flip(c7ulxn(2:21)),c7ulxp];
% c7yl=[flip(c7ulyn(2:21)),c7ulyp];
% d=plot(c7xl,c7yl,'c');
% hold on
% % Right
% c4xr=2*[flip(c4urxn(2:21)),c4urxp];
% c4yr=[flip(c4uryn(2:21)),c4uryp];
% e=plot(c4xr,c4yr,'color',[0.75, 0, 0.75]);
% hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'color',[0 0.5 1]);
hold on
grid on
grid minor
% c6xr=2*[flip(c6urxn(2:21)),c6urxp];
% c6yr=[flip(c6uryn(2:21)),c6uryp];
% g=plot(c6xr,c6yr,'color',[0.2 0 0]);
% hold on
% 
% c7xr=2*[flip(c7urxn(2:21)),c7urxp];
% c7yr=[flip(c7uryn(2:21)),c7uryp];
% h=plot(c7xr,c7yr,'color',[1 .5 0]);

leg=[b,f];
title('model 14')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C5UL','C5UR','location','north')

figure(30)
figure(31)
figure(32)




