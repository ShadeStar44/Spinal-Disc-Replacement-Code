%% Anterior Annulus Bulge of C3/4 intact model 
% This method uses three anterior nodes. one on the cranial verterea, one
% on the central annulus, and one on the caudal vertebrea. 
clear,clc
%% Data taken from Intact 6N model (TLC_6N_1-26.odb)
data = xlsread('C3_4_b6N.xlsx','C3_4_b6P');
% Cranial Node #
ycoors = data(1,3) + data(1:21,10);
zcoors = data(1,4) + data(1:21,11);
% plot (ycoors(2:21),zcoors(2:21),'go');
% hold on

% Caudal Node #
ycoors2 = data(22,3)+data(22:42,10);
zcoors2 = data(22,4)+data(22:42,11);
% plot (ycoors2(2:21),zcoors2(2:21),'ro');

% Central Annulus Node #
ycoors3 = data(43,3)+data(43:63,10);
zcoors3 = data(43,4)+data(43:63,11);
% plot (ycoors3(2:21),zcoors3(2:21),'bo')
% hold off
% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((ycoors2-ycoors).^2+(zcoors2-zcoors).^2);
nom = abs((zcoors2-zcoors).*ycoors3 - (ycoors2-ycoors).*zcoors3 + ycoors2.*zcoors-zcoors2.*ycoors);
bulge = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge(:,1),'bo')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
hold on


%% Data taken from Intact 6N model (S2_6N_APSlide_Tether.odb)
data = xlsread('APST_S26N.xlsx','APST_S26N');
% Cranial Node # 
y1 = data(1,3) + data(1:21,10);
z1 = data(1,4) + data(1:21,11);
%plot (y1(2:21),z1(2:21),'go');
%hold on

% Caudal Node #
y2 = data(22,3)+data(22:42,10);
z2 = data(22,4)+data(22:42,11);
%plot (y2(2:21),z2(2:21),'ro');

% Central Annulus Node #
y3 = data(43,3)+data(43:63,10);
z3 = data(43,4)+data(43:63,11);
%plot (y3(2:21),z3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((y2-y1).^2+(z2-z1).^2);
nom = abs((z2-z1).*y3 - (y2-y1).*z3 + y2.*z1-z2.*y1);
bulge2 = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge2(:,1),'ro')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')

%% Data taken from LatSlide 6N model (S2_6N_LatSlide_NoTether.odb)
data = xlsread('LatSlidenoTeth_C34.xlsx','LatSlidenoTeth_C34');
% Cranial Node # 
y12 = data(1,3) + data(1:21,10);
z12 = data(1,4) + data(1:21,11);
%plot (y1(2:21),z1(2:21),'go');
%hold on

% Caudal Node #
y22 = data(22,3)+data(22:42,10);
z22 = data(22,4)+data(22:42,11);
%plot (y2(2:21),z2(2:21),'ro');

% Central Annulus Node #
y32 = data(43,3)+data(43:63,10);
z32 = data(43,4)+data(43:63,11);
%plot (y3(2:21),z3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((y22-y12).^2+(z22-z12).^2);
nom = abs((z22-z12).*y32 - (y22-y12).*z32 + y22.*z12-z22.*y12);
bulge3 = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge3(:,1),'mo')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')

%% Data taken from LatSlide 6N model (S2_6N_LatSlide_Tether.odb)
data = xlsread('LatSlide_teth3_4.xlsx','LatSlide_teth3_4');
% Cranial Node # 
y123 = data(1,3) + data(1:21,10);
z123 = data(1,4) + data(1:21,11);
%plot (y1(2:21),z1(2:21),'go');
%hold on

% Caudal Node #
y223 = data(22,3)+data(22:42,10);
z223 = data(22,4)+data(22:42,11);
%plot (y2(2:21),z2(2:21),'ro');

% Central Annulus Node #
y323 = data(43,3)+data(43:63,10);
z323 = data(43,4)+data(43:63,11);
%plot (y3(2:21),z3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((y223-y123).^2+(z223-z123).^2);
nom = abs((z223-z123).*y323 - (y223-y123).*z323 + y223.*z123-z223.*y123);
bulge4 = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge4(:,1),'go')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')

%% Data taken from SlideSlide no Tether 6N model (S2_6N_SlideSlide_NoTether.odb)
data = xlsread('SS_NT_34.xlsx','SS_NT_34');
% Cranial Node # 
y1234 = data(1,3) + data(1:21,10);
z1234 = data(1,4) + data(1:21,11);
%plot (y1(2:21),z1(2:21),'go');
%hold on

% Caudal Node #
y2234 = data(22,3)+data(22:42,10);
z2234 = data(22,4)+data(22:42,11);
%plot (y2(2:21),z2(2:21),'ro');

% Central Annulus Node #
y3234 = data(43,3)+data(43:63,10);
z3234 = data(43,4)+data(43:63,11);
%plot (y3(2:21),z3(2:21),'bo')

% bulge of disc: this defines the perpendicular distance between the
% centreal annulus node and a line connecting the cranial/caudal nodes
figure(1)
demon = sqrt((y2234-y1234).^2+(z2234-z1234).^2);
nom = abs((z2234-z1234).*y3234 - (y2234-y1234).*z3234 + y2234.*z1234-z2234.*y1234);
bulge5 = nom/demon;
moment = 2.*data(1:21,12); 
plot(moment,bulge5(:,1),'ko')
xlabel('Moment (Nm)')
ylabel('Annulus Bulge (mm)')
legend('Intact','AP Slide Tether','Lat Slide No Tether','Lat Slide Tether','Slide Slide Tether')


