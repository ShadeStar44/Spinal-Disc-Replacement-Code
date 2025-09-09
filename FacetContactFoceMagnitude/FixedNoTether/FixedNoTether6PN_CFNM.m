%% Facet Contact Force Magnitude
% 6 P/N Fixed No Tether 
% file = 6NP_FixedNoTether_facetForceMagnitude.xls
figure (3)

Data = xlsread('6NP_FixedNoTether_facetForceMagnitude');  % importing the CFNM columns for each facet pair
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
ylabel('Newtons')
title({'Facet Force Magnitude(CFNM) for Fixed No Tether model','under Axial rotation(6P/6N)'})
legend('C6LR','C6LL','C5LR','C5LL','C4LR','C4LL','C3LR','C3LL','location','north')