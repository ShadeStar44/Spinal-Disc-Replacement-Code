%% runs foreman height and width narrowing graphs along with percent change
close all
clear variables
%%
run('foreman6n_c5c6L.m')
figure(5)
subplot(1,2,1)
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];

pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Right Axial Rotation')
% % % % % % % % % % % % % % % % % %
figure(8)
plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on


figure(9)
plot((t1-2)*(-2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t15-2)*(-2),-1*width15,'-.b')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
run('foreman6p_c5c6L.m')
figure(5)
subplot(1,2,2)
pc15x=mag15x(21)/mag15x(1)*100-100;
pc15y=mag15y(21)/mag15y(1)*100-100;
pc15=[pc15y,pc15x];

% pc1x=mag1x(21)/mag1x(1)*100-100;
% pc1y=mag1y(21)/mag1y(1)*100-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=mag2x(21)/mag2x(1)*100-100;
% pc2y=mag2y(21)/mag2y(1)*100-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=mag3x(21)/mag3x(1)*100-100;
% pc3y=mag3y(21)/mag3y(1)*100-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=mag4x(21)/mag4x(1)*100-100;
% pc4y=mag4y(21)/mag4y(1)*100-100;
% pc4=[pc4y,pc4x];

pc5x=mag5x(21)/mag5x(1)*100-100;
pc5y=mag5y(21)/mag5y(1)*100-100;
pc5=[pc5y,pc5x];

% pc6x=mag6x(21)/mag6x(1)*100-100;
% pc6y=mag6y(21)/mag6y(1)*100-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=mag13x(21)/mag13x(1)*100-100;
% pc13y=mag13y(21)/mag13y(1)*100-100;
% pc13=[pc13y,pc13x];

pc14x=mag14x(21)/mag14x(1)*100-100;
pc14y=mag14y(21)/mag14y(1)*100-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Left Axial Rotation')
suptitle('Left Hand C5-C6 Foramen Percent Change Under Axial Rotation')
% % % % % % % % % % % % % % % % %
figure(8)
plot((t15-2)*(2),-1*height15,'b')
hold on
plot((t1-2)*(2),-1*height1,'r')
hold on
plot((t2-2)*(2),-1*height2,'g')
hold on
plot((t3-2)*(2),-1*height3,'c')
hold on
plot((t4-2)*(2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*height14,'color',[1 .5 0])
hold on

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Left Hand Foreman Height Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')

figure(9)
plot((t15-2)*(2),-1*width15,'-.b')
hold on
plot((t1-2)*(2),-1*width1,'-.r')
hold on
plot((t2-2)*(2),-1*width2,'-.g')
hold on
plot((t3-2)*(2),-1*width3,'-.c')
hold on
plot((t4-2)*(2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*width14,'-.','color',[1 .5 0])
hold on

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Left Hand Foreman Width Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')

%%
run('foreman5n_c5c6L.m')
figure(10)
plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Left Hand Foreman Height Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(11)
plot((t1-2)*(-2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t15-2)*(-2),-1*width15,'-.b')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Left Hand Foreman Width Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')

% % % % % % % % % % % % % % % % %
figure(6)
subplot(1,2,1)
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];


pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Right Lateral Bending')
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

run('foreman5p_c5c6L.m')
figure(10)
plot((t15-2)*(2),-1*height15,'b')
hold on
plot((t1-2)*(2),-1*height1,'r')
hold on
plot((t2-2)*(2),-1*height2,'g')
hold on
plot((t3-2)*(2),-1*height3,'c')
hold on
plot((t4-2)*(2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*height14,'color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Left Hand Foreman Height Narrowing/Widening Under lateral bending')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(11)
plot((t15-2)*(2),-1*width15,'-.b')
hold on
plot((t1-2)*(2),-1*width1,'-.r')
hold on
plot((t2-2)*(2),-1*width2,'-.g')
hold on
plot((t3-2)*(2),-1*width3,'-.c')
hold on
plot((t4-2)*(2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*width14,'-.','color',[1 .5 0])
hold on

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Left Hand Foreman Width Narrowing/Widening Under Lateral Bending')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(6)
subplot(1,2,2)
pc15x=mag15x(21)/mag15x(1)*100-100;
pc15y=mag15y(21)/mag15y(1)*100-100;
pc15=[pc15y,pc15x];

% pc1x=mag1x(21)/mag1x(1)*100-100;
% pc1y=mag1y(21)/mag1y(1)*100-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=mag2x(21)/mag2x(1)*100-100;
% pc2y=mag2y(21)/mag2y(1)*100-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=mag3x(21)/mag3x(1)*100-100;
% pc3y=mag3y(21)/mag3y(1)*100-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=mag4x(21)/mag4x(1)*100-100;
% pc4y=mag4y(21)/mag4y(1)*100-100;
% pc4=[pc4y,pc4x];

pc5x=mag5x(21)/mag5x(1)*100-100;
pc5y=mag5y(21)/mag5y(1)*100-100;
pc5=[pc5y,pc5x];

% pc6x=mag6x(21)/mag6x(1)*100-100;
% pc6y=mag6y(21)/mag6y(1)*100-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=mag13x(21)/mag13x(1)*100-100;
% pc13y=mag13y(21)/mag13y(1)*100-100;
% pc13=[pc13y,pc13x];

pc14x=mag14x(21)/mag14x(1)*100-100;
pc14y=mag14y(21)/mag14y(1)*100-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Left Lateral Bending')
suptitle('Left Hand C5-C6 Foramen Percent Change Under Lateral Bending')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
run('foreman5n_c5c6R.m')
figure(7)
subplot(1,2,1)
pc15x=mag15x(21)/mag15x(1)*100-100;
pc15y=mag15y(21)/mag15y(1)*100-100;
pc15=[pc15y,pc15x];

% pc1x=mag1x(21)/mag1x(1)*100-100;
% pc1y=mag1y(21)/mag1y(1)*100-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=mag2x(21)/mag2x(1)*100-100;
% pc2y=mag2y(21)/mag2y(1)*100-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=mag3x(21)/mag3x(1)*100-100;
% pc3y=mag3y(21)/mag3y(1)*100-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=mag4x(21)/mag4x(1)*100-100;
% pc4y=mag4y(21)/mag4y(1)*100-100;
% pc4=[pc4y,pc4x];

pc5x=mag5x(21)/mag5x(1)*100-100;
pc5y=mag5y(21)/mag5y(1)*100-100;
pc5=[pc5y,pc5x];

% pc6x=mag6x(21)/mag6x(1)*100-100;
% pc6y=mag6y(21)/mag6y(1)*100-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=mag13x(21)/mag13x(1)*100-100;
% pc13y=mag13y(21)/mag13y(1)*100-100;
% pc13=[pc13y,pc13x];

pc14x=mag14x(21)/mag14x(1)*100-100;
pc14y=mag14y(21)/mag14y(1)*100-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
xticklabels({'intact','Lateral Slide','ProDisc-C'})
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Right Lateral Bending')


figure(12)
plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Height Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(13)
plot((t15-2)*(-2),-1*width15,'-.b')
hold on
plot((t1-2)*(-2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Width Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')

run('foreman5p_c5c6R.m')

figure(7)
subplot(1,2,2)

pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];


pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];


PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Left Lateral Bending')
suptitle('Right Hand C5-C6 Foramen Percent Change Lateral Bending')


figure(12)
plot((t15-2)*(2),-1*height15,'b')
hold on
plot((t1-2)*(2),-1*height1,'r')
hold on
plot((t2-2)*(2),-1*height2,'g')
hold on
plot((t3-2)*(2),-1*height3,'c')
hold on
plot((t4-2)*(2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*height14,'color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Height Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(13)
plot((t15-2)*(2),-1*width15,'-.b')
hold on
plot((t1-2)*(2),-1*width1,'-.r')
hold on
plot((t2-2)*(2),-1*width2,'-.g')
hold on
plot((t3-2)*(2),-1*width3,'-.c')
hold on
plot((t4-2)*(2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*width14,'-.','color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Width Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')

%%
run('foreman6n_c5c6R.m')
figure(17)
subplot(1,2,1)
pc15x=mag15x(21)/mag15x(1)*100-100;
pc15y=mag15y(21)/mag15y(1)*100-100;
pc15=[pc15y,pc15x];

% pc1x=mag1x(21)/mag1x(1)*100-100;
% pc1y=mag1y(21)/mag1y(1)*100-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=mag2x(21)/mag2x(1)*100-100;
% pc2y=mag2y(21)/mag2y(1)*100-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=mag3x(21)/mag3x(1)*100-100;
% pc3y=mag3y(21)/mag3y(1)*100-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=mag4x(21)/mag4x(1)*100-100;
% pc4y=mag4y(21)/mag4y(1)*100-100;
% pc4=[pc4y,pc4x];

pc5x=mag5x(21)/mag5x(1)*100-100;
pc5y=mag5y(21)/mag5y(1)*100-100;
pc5=[pc5y,pc5x];

% pc6x=mag6x(21)/mag6x(1)*100-100;
% pc6y=mag6y(21)/mag6y(1)*100-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=mag13x(21)/mag13x(1)*100-100;
% pc13y=mag13y(21)/mag13y(1)*100-100;
% pc13=[pc13y,pc13x];

pc14x=mag14x(21)/mag14x(1)*100-100;
pc14y=mag14y(21)/mag14y(1)*100-100;
pc14=[pc14y,pc14x];


PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Right Axial Rotation')


figure(14)
plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Height Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(15)
plot((t15-2)*(-2),-1*width15,'-.b')
hold on
plot((t1-2)*(-2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Width Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')

run('foreman6p_c5c6R')
figure(17)
subplot(1,2,2)
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];

pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Left Axial Rotation')
suptitle('Right Hand C5-C6 Foreman Percent Change Under Axial Rotation')

figure(14)
plot((t15-2)*(2),-1*height15,'b')
hold on
plot((t1-2)*(2),-1*height1,'r')
hold on
plot((t2-2)*(2),-1*height2,'g')
hold on
plot((t3-2)*(2),-1*height3,'c')
hold on
plot((t4-2)*(2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*height14,'color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Height Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')


figure(15)
plot((t15-2)*(2),-1*width15,'-.b')
hold on
plot((t1-2)*(2),-1*width1,'-.r')
hold on
plot((t2-2)*(2),-1*width2,'-.g')
hold on
plot((t3-2)*(2),-1*width3,'-.c')
hold on
plot((t4-2)*(2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*width14,'-.','color',[1 .5 0])
hold on
xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'Positive is Widening, Negative is Narrowing'})
title('C5-C6 Right Hand Foreman Width Narrowing/Widening Under Axial Rotation')
legend('intact', 'model 1','model 2', 'model 3','model 4','model 5','model 6','model 13','model 14','location','best')
%% 
run('foreman4n_c5c6L.m')
figure(18)
plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on
title('Extension')

figure(19)
plot((t15-2)*(-2),-1*width15,'-.b')
hold on
plot((t1-2)*(-2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on






title('Extension')

figure(20)
subplot(1,2,1)
ylabel('Percent Change')
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];


pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
title('Extension')
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})




run('foreman4p_c5c6L.m')
figure(18)
plot((t15-2)*(2),-1*height15,'b')
hold on
plot((t1-2)*(2),-1*height1,'r')
hold on
plot((t2-2)*(2),-1*height2,'g')
hold on
plot((t3-2)*(2),-1*height3,'c')
hold on
plot((t4-2)*(2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*height14,'color',[1 .5 0])
hold on

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'(Positive is Widening, Negative is Narrowing)'})
suptitle('C5-C6 Left Hand Foreman Height Narrowing/Widening Under 2 N-m of flexion')
legend('intact height','model 1 height','model 2 height','model 3 height','model 4 height','model 5 height','model 6 height','model 13 height','model 14 height','location','best')
title('Flexion')

figure(19)
plot((t15-2)*(2),-1*width15,'-.b')
hold on
plot((t1-2)*(2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t3-2)*(2),-1*width3,'-.c')
hold on
plot((t4-2)*(2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*width14,'-.','color',[1 .5 0])
hold on







title('Flexion')

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'(Positive is Widening, Negative is Narrowing)'})
suptitle('C5-C6 Left Hand Foreman Width Narrowing/Widening Under extension/flexion')
legend('intact width', 'model 1 width','model 2 width', 'model 3 width','model 4 width','model 5 width','model 6 width','model 13 width','model 14 width','location','best')

figure(20)
subplot(1,2,2)
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];


pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];


PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
xticklabels({'intact','Lateral Slide','ProDisc-C'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
suptitle('C5-C6 Left Hand Foraminal Percent Change Under extension/flexion')
title('Flexion')




%%
run('foreman4p_c5c6R.m')
figure(32)
plot((t15-2)*(2),-1*height15,'b')
hold on
plot((t1-2)*(2),-1*height1,'r')
hold on
plot((t2-2)*(2),-1*height2,'g')
hold on
plot((t3-2)*(2),-1*height3,'c')
hold on
plot((t4-2)*(2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*height14,'color',[1 .5 0])
hold on

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'(Positive is Widening, Negative is Narrowing)'})
suptitle('C5-C6 Right Hand Foreman Height Narrowing/Widening Under 2 N-m of flexion')
legend('intact height','model 1 height','model 2 height','model 3 height','model 4 height','model 5 height','model 6 height','model 13 height','model 14 height','location','best')
title('Flexion')

figure(33)
plot((t15-2)*(2),-1*width15,'-.b')
hold on
plot((t1-2)*(2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t3-2)*(2),-1*width3,'-.c')
hold on
plot((t4-2)*(2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(2),-1*width14,'-.','color',[1 .5 0])
hold on







title('Flexion')

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'(Positive is Widening, Negative is Narrowing)'})
suptitle('C5-C6 Right Hand Foreman Width Narrowing/Widening Under 2 N-m of flexion')
legend('intact width', 'model 1 width','model 2 width', 'model 3 width','model 4 width','model 5 width','model 6 width','model 13 width','model 14 width','location','best')

figure(30)
subplot(1,2,2)
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];


pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
xticklabels({'intact','Lateral Slide','ProDisc-C'})
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')

title('Flexion')


%%
run('foreman4n_c5c6R.m')
figure(32)
plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on
title('Extension')

figure(33)
plot((t15-2)*(-2),-1*width15,'-.b')
hold on
plot((t1-2)*(-2),-1*width1,'-.r')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on



title('Extension')

figure(30)
subplot(1,2,1)
ylabel('Percent Change')
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

% pc1x=(mag1x(21)/mag1x(1)*100)-100;
% pc1y=(mag1y(21)/mag1y(1)*100)-100;
% pc1=[pc1y,pc1x];
% 
% pc2x=(mag2x(21)/mag2x(1)*100)-100;
% pc2y=(mag2y(21)/mag2y(1)*100)-100;
% pc2=[pc2y,pc2x];
% 
% pc3x=(mag3x(21)/mag3x(1)*100)-100;
% pc3y=(mag3y(21)/mag3y(1)*100)-100;
% pc3=[pc3y,pc3x];
% 
% pc4x=(mag4x(21)/mag4x(1)*100)-100;
% pc4y=(mag4y(21)/mag4y(1)*100)-100;
% pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

% pc6x=(mag6x(21)/mag6x(1)*100)-100;
% pc6y=(mag6y(21)/mag6y(1)*100)-100;
% pc6=[pc6y,pc6x];
% 
% pc13x=(mag13x(21)/mag13x(1)*100)-100;
% pc13y=(mag13y(21)/mag13y(1)*100)-100;
% pc13=[pc13y,pc13x];
% 

pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

PC=[pc15;pc5;pc14];
% PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
title('Extension')
xticklabels({'intact','Lateral Slide','ProDisc-C'})
% xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
suptitle('C5-C6 Right Hand Foraminal Percent Change Under Extension/Flexion')
%%
close(figure(1))
close(figure(2))
close(figure(3))
close(figure(4))


figure(8)
figure(9)
figure(10)
figure(11)
figure(12)
figure(13)
figure(14)
figure(15)
figure(6)
figure(7)
figure(5)
figure(17)
figure(20)
figure(7)
figure(6)
figure(5)
