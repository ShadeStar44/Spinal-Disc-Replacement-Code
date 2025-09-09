%% Facet Contact Area
% 5 P/N Fixed NoTether 
% file = 5NP_FixedNoTether_facetContactArea.xls
figure (3)

Data = xlsread('5NP_FixedNoTether_facetContactArea');  % importing the CFNM/CAREA columns for each facet pair
moment=Data(:,2);
C6LR=Data(:,3);
C6LL=Data(:,6);
C5LR=Data(:,9);
C5LL=Data(:,12);
C4LR=Data(:,15);
C4LL=Data(:,18);
C3LR=Data(:,21);
C3LL=Data(:,24);

plot(moment,C6LR,'b')  % plotting Contact mean stress of each facet pair 
hold on 
plot(moment,C6LL,'m')
hold on 
plot(moment,C5LR,'g')
legend('C6LL')
hold on
plot(moment,C5LL,'r')
hold on 
plot(moment,C4LR,'c')
hold on 
plot(moment,C4LL,'color',[.5,0,.5])
hold on 
plot(moment,C3LR,'k')
hold on 
plot(moment,C3LL)

xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('Area(mm^2)')
title({'Facet Contact Area (CAREA) for Fixed NoTether model','under Lateral bending(5P/5N)'})
legend('C6LR','C6LL','C5LR','C5LL','C4LR','C4LL','C3LR','C3LL','location','south')