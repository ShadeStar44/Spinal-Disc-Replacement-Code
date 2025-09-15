%% this file runs all models for facet contact mean stress
% and produces all figures and subplots
clear variables
close all

%% intact
run('E:\results\FCMS\intact\intact6n6p')
figure(30)
subplot(1,3,1)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for intact model under axial rotation (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR','location','north')


run('E:\results\FCMS\intact\intact5n5p')
figure(31)
subplot(1,3,1)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for intact model under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')


run('E:\results\FCMS\intact\intact4n4p')
figure(32)
subplot(1,3,1)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);
leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for intact model under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')



% model 4
run('E:\results\FCMS\model4\model46n6p.m')
figure(30)
subplot(1,3,2)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 4 under axial rotation (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model4\model45n5p.m')
figure(31)
subplot(1,3,2)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 4 under lateral bending(5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model4\model44n4p.m')
figure(32)
subplot(1,3,2)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 4 under flexion/extension(4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')



% model 14
run('E:\results\FCMS\model14\model146n6p.m')
figure(30)
subplot(1,3,3)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 14 under axial rotaiton (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model14\model145n5p.m')
figure(31)
subplot(1,3,3)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 14 under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model14\model144n4p.m')
figure(32)
subplot(1,3,3)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color','y');
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 14 under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

figure(30)
figure(31)
figure(32)

