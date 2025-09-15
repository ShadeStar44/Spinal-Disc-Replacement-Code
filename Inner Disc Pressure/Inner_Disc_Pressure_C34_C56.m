% Gallizioli, Nick
% Inner Disc pressure for C34 (Element # 29175) and C56 (Element # 72329) 
% Analyzing 4th and 5th degree of freedom

%% Analysis for 4th Degree of Freedom

IDP4_DataC34 = xlsread('InnerDiscPressures','C34');
IDP4_DataC56 = xlsread('InnerDiscPressures','C56');
moment = IDP4_DataC34(3:44,2);

%% Plotting C34 Inner Disc Pressures

M1_34 = IDP4_DataC34(3:44,17);
M2_34 = IDP4_DataC34(3:44,16);
M3_34 = IDP4_DataC34(3:44,15);
M4_34 = IDP4_DataC34(3:44,14);
M5_34 = IDP4_DataC34(3:44,13);
M6_34 = IDP4_DataC34(3:44,12);
M7_34 = IDP4_DataC34(3:44,11);
M8_34 = IDP4_DataC34(3:44,10);
M9_34 = IDP4_DataC34(3:44,9);
M10_34 = IDP4_DataC34(3:44,8);
M11_34 = IDP4_DataC34(3:44,7);
M12_34 = IDP4_DataC34(3:44,6);
M13_34 = IDP4_DataC34(3:44,5);
M14_34 = IDP4_DataC34(3:44,4);
M15_34 = IDP4_DataC34(3:44,3);

figure(1)
plot(moment,M1_34,'b')  % plotting inner disc pressure for each model 
hold on 
plot(moment,M2_34,'m--')
hold on 
plot(moment,M3_34,'g')
hold on
plot(moment,M4_34,'r--')
hold on 
plot(moment,M5_34,'c')
hold on 
plot(moment,M6_34,'--','color',[.5,0,.5])
hold on 
plot(moment,M7_34,'k')
hold on 
plot(moment,M8_34,'--','color',[1,.5,.5])
hold on 
plot(moment,M9_34,'color',[.2,.7,1])
hold on 
plot(moment,M10_34,'--','color',[.4,.7,.5])
hold on 
plot(moment,M11_34,'color',[.5,.5,1])
hold on 
plot(moment,M12_34,'--','color',[1,.7,.7])
hold on 
plot(moment,M13_34,'color',[.25,.8,.54])
hold on 
plot(moment,M14_34,'--','color',[.47,.25,.8])
hold on 
plot(moment,M15_34,'color',[1,.54,0],'linewidth',2)

xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('Pressure (N/m^2)')
title({'Inner Disc Pressure(CFNM) for C34 Disc','under Flexion/Extention(4N/4P)'})
legend('Model 1','Model 2','Model 3','Model 4','Model 5','Model 6','Model 7','Model 8','Model 9', 'Model 10','Model 11','Model 12','Model 13','Model 14', 'Model 15','location','northwest')

%% Plotting C56 Inner Disc Pressures

M1_56 = IDP4_DataC56(1:42,17);
M2_56 = IDP4_DataC56(1:42,16);
M3_56 = IDP4_DataC56(1:42,15);
M4_56 = IDP4_DataC56(1:42,14);
M5_56 = IDP4_DataC56(1:42,13);
M6_56 = IDP4_DataC56(1:42,12);
M7_56 = IDP4_DataC56(1:42,11);
M8_56 = IDP4_DataC56(1:42,10);
M9_56 = IDP4_DataC56(1:42,9);
M10_56 = IDP4_DataC56(1:42,8);
M11_56 = IDP4_DataC56(1:42,7);
M12_56 = IDP4_DataC56(1:42,6);
M13_56 = IDP4_DataC56(1:42,5);
M14_56 = IDP4_DataC56(1:42,4);
M15_56 = IDP4_DataC56(1:42,3);

figure(2)
plot(moment,M1_56,'b')  % plotting inner disc pressure for each model 
hold on 
plot(moment,M2_56,'m--')
hold on 
plot(moment,M3_56,'g')
hold on
plot(moment,M4_56,'r--')
hold on 
plot(moment,M5_56,'c')
hold on 
plot(moment,M6_56,'--','color',[.5,0,.5])
hold on 
plot(moment,M7_56,'k')
hold on 
plot(moment,M8_56,'--','color',[1,.5,.5])
hold on 
plot(moment,M9_56,'color',[.2,.7,1])
hold on 
plot(moment,M10_56,'--','color',[.4,.7,.5])
hold on 
plot(moment,M11_56,'color',[.5,.5,1])
hold on 
plot(moment,M12_56,'--','color',[1,.7,.7])
hold on 
plot(moment,M13_56,'color',[.25,.8,.54])
hold on 
plot(moment,M14_56,'--','color',[.47,.25,.8])
hold on 
plot(moment,M15_56,'color',[1,.54,0],'linewidth',2)

xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('Pressure (N/m^2)')
title({'Inner Disc Pressure(CFNM) for C56 Disc','under Flexion/Extention(4N/4P)'})
legend('Model 1','Model 2','Model 3','Model 4','Model 5','Model 6','Model 7','Model 8','Model 9', 'Model 10','Model 11','Model 12','Model 13','Model 14', 'Model 15','location','northwest')

%% Analysis for 5th Degree of Freedom

IDP5_DataC34 = xlsread('5N_DISC_PRESSURE','C34');
IDP5_DataC56 = xlsread('5N_DISC_PRESSURE','C56');
moment = IDP5_DataC34(3:44,2);

%% Plotting C34 Inner Disc Pressures

M1_345 = IDP5_DataC34(3:44,17);
M2_345 = IDP5_DataC34(3:44,16);
M3_345 = IDP5_DataC34(3:44,15);
M4_345 = IDP5_DataC34(3:44,14);
M5_345 = IDP5_DataC34(3:44,13);
M6_345 = IDP5_DataC34(3:44,12);
M7_345 = IDP5_DataC34(3:44,11);
M8_345 = IDP5_DataC34(3:44,10);
M9_345 = IDP5_DataC34(3:44,9);
M10_345 = IDP5_DataC34(3:44,8);
M11_345 = IDP5_DataC34(3:44,7);
M12_345 = IDP5_DataC34(3:44,6);
M13_345 = IDP5_DataC34(3:44,5);
M14_345 = IDP5_DataC34(3:44,4);
M15_345 = IDP5_DataC34(3:44,3);

figure(3)
plot(moment,M1_345,'b')  % plotting inner disc pressure for each model 
hold on 
plot(moment,M2_345,'m--')
hold on 
plot(moment,M3_345,'g')
hold on
plot(moment,M4_345,'r--')
hold on 
plot(moment,M5_345,'c')
hold on 
plot(moment,M6_345,'--','color',[.5,0,.5])
hold on 
plot(moment,M7_345,'k')
hold on 
plot(moment,M8_345,'--','color',[1,.5,.5])
hold on 
plot(moment,M9_345,'color',[.2,.7,1])
hold on 
plot(moment,M10_345,'--','color',[.4,.7,.5])
hold on 
plot(moment,M11_345,'color',[.5,.5,1])
hold on 
plot(moment,M12_345,'--','color',[1,.7,.7])
hold on 
plot(moment,M13_345,'color',[.25,.8,.54])
hold on 
plot(moment,M14_345,'--','color',[.47,.25,.8])
hold on 
plot(moment,M15_345,'color',[1,.54,0],'linewidth',2)

xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('Pressure (N/m^2)')
title({'Inner Disc Pressure(CFNM) for C34 Disc','under Flexion/Extention(5N/5P)'})
legend('Model 1','Model 2','Model 3','Model 4','Model 5','Model 6','Model 7','Model 8','Model 9', 'Model 10','Model 11','Model 12','Model 13','Model 14', 'Model 15','location','east')

%% Plotting C56 Inner Disc Pressures

M1_565 = IDP5_DataC56(1:42,17);
M2_565 = IDP5_DataC56(1:42,16);
M3_565 = IDP5_DataC56(1:42,15);
M4_565 = IDP5_DataC56(1:42,14);
M5_565 = IDP5_DataC56(1:42,13);
M6_565 = IDP5_DataC56(1:42,12);
M7_565 = IDP5_DataC56(1:42,11);
M8_565 = IDP5_DataC56(1:42,10);
M9_565 = IDP5_DataC56(1:42,9);
M10_565 = IDP5_DataC56(1:42,8);
M11_565 = IDP5_DataC56(1:42,7);
M12_565 = IDP5_DataC56(1:42,6);
M13_565 = IDP5_DataC56(1:42,5);
M14_565 = IDP5_DataC56(1:42,4);
M15_565 = IDP5_DataC56(1:42,3);

figure(4)
plot(moment,M1_565,'b')  % plotting inner disc pressure for each model 
hold on 
plot(moment,M2_565,'m--')
hold on 
plot(moment,M3_565,'g')
hold on
plot(moment,M4_565,'r--')
hold on 
plot(moment,M5_565,'c')
hold on 
plot(moment,M6_565,'--','color',[.5,0,.5])
hold on 
plot(moment,M7_565,'k')
hold on 
plot(moment,M8_565,'--','color',[1,.5,.5])
hold on 
plot(moment,M9_565,'color',[.2,.7,1])
hold on 
plot(moment,M10_56,'--','color',[.4,.7,.5])
hold on 
plot(moment,M11_565,'color',[.5,.5,1])
hold on 
plot(moment,M12_565,'--','color',[1,.7,.7])
hold on 
plot(moment,M13_565,'color',[.25,.8,.54])
hold on 
plot(moment,M14_565,'--','color',[.47,.25,.8])
hold on 
plot(moment,M15_565,'color',[1,.54,0],'linewidth',2)

xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('Pressure (N/m^2)')
title({'Inner Disc Pressure(CFNM) for C56 Disc','under Flexion/Extention(5N/5P)'})
legend('Model 1','Model 2','Model 3','Model 4','Model 5','Model 6','Model 7','Model 8','Model 9', 'Model 10','Model 11','Model 12','Model 13','Model 14', 'Model 15','location','eastoutside','orientation','vertical')
