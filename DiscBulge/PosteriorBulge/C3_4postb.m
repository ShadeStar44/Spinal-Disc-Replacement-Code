%% Posterior Annulus Bulge of C3/4 intact model
% This method uses three posterior nodes. one on the cranial verterea, one
% on the central annulus, and one on the caudal vertebrea. 
clear,clc
%% Data taken from Intact 4P model (TLC_4P_1-26.odb)
data = xlsread('C3_4postb.xlsx','C3_4postb');
% Cranial Node #
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
plot (ycoors(2:21),zcoors(2:21),'go');
hold on

% Caudal Node #
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
plot (ycoors2(2:21),zcoors2(2:21),'ro');

% Central Annulus Node #
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
plot (ycoors3(2:21),zcoors3(2:21),'bo')
hold off
% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(2)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,21),'bo')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
