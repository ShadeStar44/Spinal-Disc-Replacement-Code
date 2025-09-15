%% Anterior Annulus Bulge of C3/4 in the 4P direction
% This method uses three anterior nodes. one on the cranial verterea, one
% on the central annulus, and one on the caudal vertebrea. 
clear,clc

%% Data taken from Intact 4P model (TLC_4P_1-26.odb)
data = xlsread('C3_4bulge.xlsx','B3node');
% Cranial Node #[11002]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% plot (ycoors(2:21),zcoors(2:21),'g');
% hold on

% Caudal Node #[27979]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% plot (ycoors2(2:21),zcoors2(2:21),'r');

% Central Annulus Node #[33106]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
% plot (ycoors3(2:21),zcoors3(2:21),'b')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,13); 
plot(moment,bulge(:,1),'b')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])
hold on


%% Data taken from (S2_4P_SlideSlide_Tether.odb)
data = xlsread('4P_M1_34bulge.xlsx');
% Cranial Node #[11002]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% plot (ycoors(2:21),zcoors(2:21),'g');
% hold on

% Caudal Node #[27979]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% plot (ycoors2(2:21),zcoors2(2:21),'r');

% Central Annulus Node #[33106]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
% plot (ycoors3(2:21),zcoors3(2:21),'b')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'g')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])
hold on

%% Data taken from (S2_4P_APSlide_NoTether.odb)
data = xlsread('4P_M4_34bulge.xlsx');
% Cranial Node #[11002]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% plot (ycoors(2:21),zcoors(2:21),'go');
% hold on

% Caudal Node #[27979]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% plot (ycoors2(2:21),zcoors2(2:21),'ro');

% Central Annulus Node #[33106]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
% plot (ycoors3(2:21),zcoors3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'r')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])
hold on

%% Data taken from (S2_4P_LatSlide_Tether.odb)
data = xlsread('4P_M5_34bulge.xlsx');
% Cranial Node #[11002]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% plot (ycoors(2:21),zcoors(2:21),'go');
% hold on

% Caudal Node #[27979]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% plot (ycoors2(2:21),zcoors2(2:21),'ro');

% Central Annulus Node #[33106]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
% plot (ycoors3(2:21),zcoors3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'m')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([0,1])
hold on
leg = legend('show');
title(leg,'Model Type')
legend('Intact','Slide Slide Tethered','Anterior Posterior Slide','Lateral Slide','Location','Southeast')
title('Disc Bulge')
