%% Facet Contact Mean Stress
% 6 P/N C6LL_7UL
figure (2)

% importing data for each model for the 6NP CMS (CFNM/CAREA)
Data = xlsread('6NP_FacetContactMeanStress');

% Getting the columns for the C6LL/7UL facets 
moment=Data(798:845,2);
M1=Data(1:48,6);
M2=Data(58:105,6);
M3=Data(115:162,6);
M4=Data(172:219,6);
M5=Data(229:276,6);
M6=Data(286:333,6);
M7=Data(343:390,6);
M8=Data(400:447,6);
M9=Data(457:504,6);
M10=Data(514:561,6);
M11=Data(571:618,6);
M12=Data(628:675,6);
M13=Data(685:732,6);
M14=Data(742:789,6);
M15=Data(798:845,6);

plot(moment,M1,'b')  % plotting Contact mean stress of the facet pairs for each model 
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
ylabel('MPa')
title({'Facet Contact Mean Stress for C6LL/7UL','under Axial rotation(6P/6N)'})
legend('Model 1','Model 2','Model 3','Model 4','Model 5','Model 6','Model 7','Model 8','Model 9', 'Model 10','Model 11','Model 12','Model 13','Model 14', 'Model 15','location','north')