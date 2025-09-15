%% Facet Contact Area
% 6 P/N 3LR
figure (15)

% importing data for each model for the 6NP CPRESS
Data = xlsread('6NP_facetPeakStress');   

% Getting the columns for the C3LR facet
moment=Data([855:875,884:905],2);
M1=Data([1:21,30:51],45);
M2=Data([62:82,91:112],45);
M3=Data([123:143,152:173],45);
M4=Data([184:204,213:234],45);
M5=Data([245:265,274:295],45);
M6=Data([306:326,335:356],45);
M7=Data([367:387,396:417],45);
M8=Data([428:448,457:478],45);
M9=Data([489:509,518:539],45);
M10=Data([550:570,579:600],45);
M11=Data([611:631,640:661],45);
M12=Data([672:692,701:722],45);
M13=Data([733:753,762:783],45);
M14=Data([794:814,823:844],45);
M15=Data([855:875,884:905],45);

plot(moment,M1,'b')  % plotting facet peak stress of the facet pairs for each model 
hold on 
plot(moment,M2,'m--')
hold on 
plot(moment,M3,'g')
hold on
plot(moment,M4,'r--')
hold on 
plot(moment,M5,'c')
hold on 
plot(moment,M6,'--','color',[.5,0,.5])
hold on 
plot(moment,M7,'k')
hold on 
plot(moment,M8,'--','color',[1,.5,.5])
hold on 
plot(moment,M9,'color',[.2,.7,1])
hold on 
plot(moment,M10,'--','color',[.4,.7,.5])
hold on 
plot(moment,M11,'color',[.5,.5,1])
hold on 
plot(moment,M12,'--','color',[1,.7,.7])
hold on 
plot(moment,M13,'color',[.25,.8,.54])
hold on 
plot(moment,M14,'--','color',[.47,.25,.8])
hold on 
plot(moment,M15,'color',[1,.54,0],'linewidth',2)

xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('mPa')
title({'Facet Peak Stress (CPRESS) for C3LR','under Axial Rotation(6P/6N)'})
legend('Model 1','Model 2','Model 3','Model 4','Model 5','Model 6','Model 7','Model 8','Model 9', 'Model 10','Model 11','Model 12','Model 13','Model 14', 'Model 15','location','northeast')