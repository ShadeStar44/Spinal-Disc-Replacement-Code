%% Anterior Annulus Bulge of C5/6 
% This method uses three anterior nodes. one on the cranial verterea, one
% on the central annulus, and one on the caudal vertebrea. 
clear,clc
%% Data taken from Intact 4P model (TLC_4P_1-26.odb)
data = xlsread('C5_6bulge.xlsx','C5_6bulge');
% Cranial Node #[47997]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% Caudal Node #[75167]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% Central Annulus Node #[80978]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);

demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'bo')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([1,1.5])
hold on

%% Data taken from (S2_4P_SlideSlide_Tether.odb)
data = xlsread('4P_M1_56bulge.xlsx');
% Cranial Node #[47997]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% Caudal Node #[75167]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% Central Annulus Node #[80978]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);

demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'go')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([1,1.5])

%% Data taken from (S2_4P_APSlide_NoTether.odb)
data = xlsread('4P_M4_56bulge.xlsx');
% Cranial Node #[47997]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% Caudal Node #[75167]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% Central Annulus Node #[80978]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);

demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'ro')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([1,1.5])

%% Data taken from (S2_4P_LaSlide_Tether.odb)
data = xlsread('4P_M5_56bulge.xlsx');
% Cranial Node #[47997]
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% Caudal Node #[75167]
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% Central Annulus Node #[80978]
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);

demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'mo')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
ylim([1,1.5])