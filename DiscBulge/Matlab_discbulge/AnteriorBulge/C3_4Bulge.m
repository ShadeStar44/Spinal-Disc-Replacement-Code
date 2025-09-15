%% Anterior Annulus Bulge of C3/4 
% This method uses three anterior nodes. one on the cranial verterea, one
% on the central annulus, and one on the caudal vertebrea. 
clear,clc

%% Data taken from Intact 4P model (TLC_4P_1-26.odb)
data = xlsread('C3_4bulge.xlsx','B3node');
% Cranial Node #[11002]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
plot (ycoors(2:21),zcoors(2:21),'go');
hold on

% Caudal Node #[27979]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
plot (ycoors2(2:21),zcoors2(2:21),'ro');

% Central Annulus Node #[33106]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
plot (ycoors3(2:21),zcoors3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(2)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,13); 
plot(moment,bulge(:,1),'bo')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])
hold on


%% Data taken from Intact 4P model (TLC_4P_1-26.odb)
data = xlsread('4Ptry2.xlsx','4Ptry2');
% Cranial Node #[11002]
ycoor = data(1,3) + data(1:21,10);
zcoor = data(1,4) + data(1:21,11);
% plot (ycoor(2:21),zcoor(2:21),'go');
% hold on

% Caudal Node #[27979]
ycoor2 = data(22,3)+data(22:42,10);
zcoor2 = data(22,4)+data(22:42,11);
%plot (ycoor2(2:21),zcoor2(2:21),'ro');

% Central Annulus Node #[33106]
ycoor3 = data(43,3)+data(43:63,10);
zcoor3 = data(43,4)+data(43:63,11);
%plot (ycoor3(2:21),zcoor3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(2)
demon = sqrt((ycoor2-ycoor).^2+(zcoor2-zcoor).^2);
nom = abs((zcoor2-zcoor).*ycoor3 - (ycoor2-ycoor).*zcoor3 + ycoor2.*zcoor-zcoor2.*ycoor);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'ro')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])


%% Data taken from Intact 4P model (TLC_4P_1-26.odb) 3rd set of points to check sensitivity
data = xlsread('4P_34.xlsx','4P_34');
% Cranial Node #[11002]
y1 = data(1,3) + data(1:21,10);
z1 = data(1,4) + data(1:21,11);
% plot (ycoor(2:21),zcoor(2:21),'go');
% hold on

% Caudal Node #[27979]
y2 = data(22,3)+data(22:42,10);
z2 = data(22,4)+data(22:42,11);
%plot (ycoor2(2:21),zcoor2(2:21),'ro');

% Central Annulus Node #[33106]
y3 = data(43,3)+data(43:63,10);
z3 = data(43,4)+data(43:63,11);
%plot (ycoor3(2:21),zcoor3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(2)
demon = sqrt((y2-y1).^2+(z2-z1).^2);
nom = abs((z2-z1).*y3 - (y2-y1).*z3 + y2.*z1-z2.*y1);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'go')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])

%% Data taken from Intact 4P model (TLC_4P_1-26.odb) 4th set of points to check sensitivity
data = xlsread('4P_34_try4.xlsx','4P_34_try4');
% Cranial Node #[11002]
y12 = data(1,3) + data(1:21,10);
z12 = data(1,4) + data(1:21,11);
% plot (ycoor(2:21),zcoor(2:21),'go');
% hold on

% Caudal Node #[27979]
y22 = data(22,3)+data(22:42,10);
z22 = data(22,4)+data(22:42,11);
%plot (ycoor2(2:21),zcoor2(2:21),'ro');

% Central Annulus Node #[33106]
y32 = data(43,3)+data(43:63,10);
z32 = data(43,4)+data(43:63,11);
%plot (ycoor3(2:21),zcoor3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(2)
demon = sqrt((y22-y12).^2+(z22-z12).^2);
nom = abs((z22-z12).*y32 - (y22-y12).*z32 + y22.*z12-z22.*y12);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'co')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])
%% Data taken from Intact 4P model (TLC_4P_1-26.odb) 5th set of points to check sensitivity
% these nodes were used specifically to show that this method works as
% expected. A node close to the edge of the annulus was used as the central
% anterior node and therefore should have the smallest magnitude of bulge

data = xlsread('4P_34_try5.xlsx','4P_34_try5');
% Cranial Node #[11002]
y123 = data(1,3) + data(1:21,10);
z123 = data(1,4) + data(1:21,11);
% plot (ycoor(2:21),zcoor(2:21),'go');
% hold on

% Caudal Node #[27979]
y223 = data(22,3)+data(22:42,10);
z223 = data(22,4)+data(22:42,11);
%plot (ycoor2(2:21),zcoor2(2:21),'ro');

% Central Annulus Node #[33106]
y323 = data(43,3)+data(43:63,10);
z323 = data(43,4)+data(43:63,11);
%plot (ycoor3(2:21),zcoor3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(2)
demon = sqrt((y223-y123).^2+(z223-z123).^2);
nom = abs((z223-z123).*y323 - (y223-y123).*z323 + y223.*z123-z223.*y123);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'ko')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])

