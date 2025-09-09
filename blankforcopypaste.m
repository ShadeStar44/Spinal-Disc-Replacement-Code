%% Facet contact force magnitude (N)
% model14_LatSlide_NoTether/4n & 4p
clear all;
%% 4P
figure (16)

c4ulxp=[]-2;
c4ulyp=[];

c4urxp=[]-2;
c4uryp=[];

c5ulxp=[]-2;
c5ulyp=[];

c5urxp=[]-2;
c5uryp=[];

c6ulxp=[]-2;
c6ulyp=[];

c6urxp=[]-2;
c6uryp=[];

c7ulxp=[]-2;
c7ulyp=[];

c7urxp=[]-2;
c7uryp=[];

%% 4N

c4ulxn=-1*[]+2;
c4ulyn=[];

c4urxn=-1*[]+2;
c4uryn=[];

c5ulxn=-1*[]+2;
c5ulyn=[];

c5urxn=-1*[]+2;
c5uryn=[];

c6ulxn=-1*[]+2;
c6ulyn=[];

c6urxn=-1*[]+2;
c6uryn=[];

c7ulxn=-1*[]+2;
c7ulyn=[];

c7urxn=-1*[]+2;
c7uryn=[];
%% left

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
%% Right

c4xr=2*[flip(c4urxn(2:21)),c4urxp];
c4yr=[flip(c4uryn(2:21)),c4uryp];
e=plot(c4xr,c4yr,'-.r');
hold on

c5xr=2*[flip(c5urxn(2:21)),c5urxp];
c5yr=[flip(c5uryn(2:21)),c5uryp];
f=plot(c5xr,c5yr,'-.g');
hold on

c6xr=2*[flip(c6urxn(2:21)),c6urxp];
c6yr=[flip(c6uryn(2:21)),c6uryp];
g=plot(c6xr,c6yr,'-.b');
hold on

c7xr=2*[flip(c7urxn(2:21)),c7urxp];
c7yr=[flip(c7uryn(2:21)),c7uryp];
h=plot(c7xr,c7yr,'-.c');

leg=[a,b,c,d,e,f,g,h];
title('Facet Contact Force Magntiude (CFNM) for model 14 under extension/flexion (4N/4P)')
xlabel('Moment (N-m)')
ylabel('Force (N)')
legend(leg,'C4UL','C5UL','C6UL','C7UL','C4UR','C5UR','C6UR','C7UR','location','north')