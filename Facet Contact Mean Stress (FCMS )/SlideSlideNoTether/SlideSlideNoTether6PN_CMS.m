%% Facet Contact Mean Stress
% 6 P/N Slide slide No tether 
% file = 6NP_SlideSlide_NoTether_CMS.xls
figure (7)

Data = xlsread('6NP_SlideSlide_NoTether_CMS');  % importing the CFNM/CAREA columns for each facet pair
moment=Data(:,2);
C6LR=Data(:,5);
C6LL=Data(:,10);
C5LR=Data(:,15);
C5LL=Data(:,20);
C4LR=Data(:,25);
C4LL=Data(:,30);
C3LR=Data(:,35);
C3LL=Data(:,40);

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
ylabel('Stress (MPa)')
title({'Facet Contact Mean Stress for Slide Slide No Tether model','under Axial rotation(6P/6N)'})
legend('C6LR','C6LL','C5LR','C5LL','C4LR','C4LL','C3LR','C3LL','location','north')